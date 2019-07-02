//
//  CourseCell.swift
//  UnitTestSample
//
//  Created by Shyam Kumar on 18/06/19.
//  Copyright © 2019 Shyam Kumar. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    var courseViewModel: CourseViewModel! {
        didSet {
            titleLabel.text = courseViewModel.name
            descriptionLabel.text = courseViewModel.description
        }
    }
    
}
