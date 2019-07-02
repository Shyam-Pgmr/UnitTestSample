//
//  HomeViewModel.swift
//  UnitTestSample
//
//  Created by Shyam Kumar on 18/06/19.
//  Copyright © 2019 Shyam Kumar. All rights reserved.
//

import Foundation

final class HomeViewModel {
    typealias VoidClosure = ()->Void
    var courses = [CourseViewModel]()
    var refreshList: VoidClosure?
    
    init() {
        
    }
}

extension HomeViewModel {
    
    func fetchCourses() {
        Services.shared.fetchCourses { [unowned self] (result) in
            switch result {
            case .success(let courses):
                if let courses = courses {
                    self.courses = courses.map { CourseViewModel(course: $0) }
                    self.refreshList?()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
