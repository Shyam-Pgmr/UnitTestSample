//
//  Course.swift
//  UnitTestSample
//
//  Created by Shyam Kumar on 17/06/19.
//  Copyright © 2019 Shyam Kumar. All rights reserved.
//

import Foundation

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let numberOfLessons: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, link, imageUrl
        case numberOfLessons = "number_of_lessons"
    }
}
