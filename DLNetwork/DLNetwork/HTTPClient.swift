//
//  HTTPClient.swift
//  DLNetwork
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

public enum RequestType: String {
    case GET = "GET"
    case POST = "POST"
}

public protocol HTTPClientType: class {
    func request<T>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (T) -> Void) where T : Decodable, T : Encodable
}

open class HTTPClient: HTTPClientType {
    
    // MARK: - Privates Properties

    private let engine: HTTPEngine
    private let jsonDecoder: JSONDecoder

    // MARK: - Init

    public init(engine: HTTPEngine) {
        self.engine = engine
        self.jsonDecoder = JSONDecoder()
    }

    // MARK: - Helpers

    open func request<T>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (T) -> Void) where T: Codable {
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue

        engine.send(request: request, cancelledBy: token, callback: { data, _, _ in
            guard let data = data else { return }
            self.decodeJSON(type: T.self, data: data, completion: completion)
        })
    }

    private func decodeJSON<T>(type: T.Type, data: Data, completion: @escaping (T) -> Void) where T: Codable {
        guard let decodedData = try? jsonDecoder.decode(type.self, from: data) else {
            print("Decoder was unable to decode: \(type.self)")
            return
        }
        completion(decodedData)
    }
}
