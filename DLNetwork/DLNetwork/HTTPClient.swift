//
//  HTTPClient.swift
//  DLNetwork
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

public enum RequestType: String {
    case GET
    case POST
}

public enum HTTPClientError: Error {
    case unableToParseToJSON(Data)
    case random
    case missingData
    case generic(Error)
}

public protocol HTTPClientType: class {
    func request<T: Decodable>(
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (Result<T, HTTPClientError>) -> Void
    )
}

public class HTTPClient: HTTPClientType {

    // MARK: - Privates Properties

    private let engine: HTTPEngine
    private let jsonDecoder: JSONDecoder

    // MARK: - Init

    public init(engine: HTTPEngine) {
        self.engine = engine
        self.jsonDecoder = JSONDecoder()
    }

    // MARK: - Helpers

    public func request<T: Decodable>(
        requestType: RequestType,
        url: URL,
        cancelledBy token: RequestCancellationToken,
        completion: @escaping (Result<T, HTTPClientError>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue

        engine.send(request: request, cancelledBy: token) { (data, _, error) in
            if let error = error {
                completion(.failure(.generic(error)))
                return
            } else if let data = data {
                self.decodeJSON(data: data, completion: completion)
            } else {
                completion(.failure(.missingData))
            }
        }
    }

    private func decodeJSON<T: Decodable>(
        data: Data,
        completion: @escaping (Result<T, HTTPClientError>) -> Void
    ) {
        guard let decodedData = try? jsonDecoder.decode(T.self, from: data) else {
            completion(.failure(.unableToParseToJSON(data)))
            return
        }
        completion(.success(decodedData))
    }
}
