//
//  ViewController.swift
//  UnitTestSample
//
//  Created by Shyam Kumar on 17/06/19.
//  Copyright © 2019 Shyam Kumar. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    @IBOutlet var tableview: UITableView!
    
    private let viewModel = HomeViewModel()
    private var courses: [CourseViewModel] {
        return viewModel.courses
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupViewModelBinding() {
        
        viewModel.refreshList = { [weak self] in
            DispatchQueue.main.async {
                self?.tableview.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        tableview.tableFooterView = UIView()
        tableview.register(UINib(nibName: "CourseCell", bundle: nil), forCellReuseIdentifier: "CourseCell")
        tableview.estimatedRowHeight = 60.0
    }
    
    private func setupUI() {
        setupTableView()
        setupViewModelBinding()
        viewModel.fetchCourses()
    }

}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CourseCell") as! CourseCell
        cell.courseViewModel = courses[indexPath.row]
        return cell
    }
}
