//
//  MapRepositoryTests.swift
//  DelicatessenTests
//
//  Created by Damien Rojo on 23.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import XCTest
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
    
    var result: MerchantsResponse!
    
    func request<T: Codable>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (T) -> Void) {
        guard let result = result as? T else { return }
        completion(result)
    }
}
