//
//  UnitTestSampleTests.swift
//  UnitTestSampleTests
//
//  Created by Shyam Kumar on 18/06/19.
//  Copyright © 2019 Shyam Kumar. All rights reserved.
//

import XCTest
@testable import UnitTestSample

class HomeViewModelTests: XCTestCase {

    var courseViewModel: CourseViewModel!
    
    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidCourseName() {
        let courseViewModel = CourseViewModel(course: Course(id: 1, name: "iOS", link: "", imageUrl: "", numberOfLessons: 5))
        XCTAssert(courseViewModel.name == "Course - iOS", "Invalid Course name")
    }
    
    func testValidCourseDescription() {
        let courseViewModel = CourseViewModel(course: Course(id: 1, name: "iOS", link: "", imageUrl: "", numberOfLessons: 5))
        XCTAssert(courseViewModel.description == "Number of Lessons - 5", "Invalid Course description")
    }

}
