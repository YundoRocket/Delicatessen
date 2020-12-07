//
//  MapRepositoryTests.swift
//  DelicatessenTests
//
//  Created by Damien Rojo on 23.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import XCTest
import DLNetwork
@testable import Delicatessen

final class MapRepositoryTests: XCTestCase {
    func testGivenRecipesListRepository_WhenGetRecipes_IsCorrectlyReturned() {
        let expectedResponse = mockMerchantsResponse
        let mockClient = MockHTTPClientType()
        mockClient.result = mockMerchantsResponse

        let repository = MapRepository(client: mockClient)
        let expectation = self.expectation(description: "Response Return")
            
        repository.getMerchants { result in
            XCTAssertEqual(result, expectedResponse)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

final class MockHTTPClientType: HTTPClientType {
    
    var result: Decodable!

    func request<T>(requestType: RequestType, url: URL, cancelledBy token: RequestCancellationToken, completion: @escaping (Result<T, HTTPClientError>) -> Void) where T : Decodable {
        completion(.success(result as! T))
    }
}
