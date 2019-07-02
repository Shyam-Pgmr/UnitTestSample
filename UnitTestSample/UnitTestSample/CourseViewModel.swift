//
//  CourseViewModel.swift
//  UnitTestSample
//
//  Created by Shyam Kumar on 17/06/19.
//  Copyright © 2019 Shyam Kumar. All rights reserved.
//

import Foundation

struct CourseViewModel {
    private let course: Course
    
    init(course: Course) {
        self.course = course
    }
    
    var name: String {
        return "Course : \(course.name)"
    }
    
    var description: String {
        return "Number of Lessons - \(course.numberOfLessons)"
    }
}
