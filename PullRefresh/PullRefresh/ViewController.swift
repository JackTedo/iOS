//
//  ViewController.swift
//  PullRefresh
//
//  Created by zon liu on 2019/4/15.
//  Copyright © 2019 Man. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var table: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        return tableView
    }()
    
    lazy var refresh: UIRefreshControl = {
        let refresh = UIRefreshControl(frame: .zero)
     //   refresh.translatesAutoresizingMaskIntoConstraints = false

        refresh.attributedTitle = NSAttributedString(string: "hello")
        refresh.addTarget(self, action: #selector(pullRefresh), for: .valueChanged)
        self.table.addSubview(refresh)
        return refresh
    }()
    @objc func pullRefresh() {
        print("pull now")
        refresh.endRefreshing()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupConstraints()
    }

    func setupConstraints() {
        table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        table.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        table.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true

        let _ = refresh
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "theCell")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dt = NSDate() as Date
        let dateStr = dateFormatter.string(from: dt)
        cell.textLabel?.text = dateStr
        return cell

    }
    
    
}

