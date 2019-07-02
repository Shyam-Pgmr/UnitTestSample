//
//  ServicesTests.swift
//  UnitTestSampleTests
//
//  Created by Shyam Kumar on 18/06/19.
//  Copyright © 2019 Shyam Kumar. All rights reserved.
//

import XCTest
@testable import UnitTestSample

class ServicesTests: XCTestCase {
    
    func testFetchCourses() {
        
        let successResponseExectation = expectation(description: "Courses fetched")
        
        Services.shared.fetchCourses { (result) in
            switch result {
            case .success(let response):
                if let response = response {
                    XCTAssert(response.count > 0, "Empty array received")
                    successResponseExectation.fulfill()
                }
            case .failure(let error):
                XCTFail("Error in fetching - \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10.0) { (error) in
            
        }
    }
    
}
