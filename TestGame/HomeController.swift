//
//  ViewController.swift
//  TestGame
//
//  Created by Казюка Руслан Сергеевич on 19.03.18.
//  Copyright © 2018 Казюка Руслан Сергеевич. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    private var cellIdentifier = "Cell"
    var dataForTableView = ModelForTableCell()
    
    private var dataArray  = [DataModel]()
    var topNavigationConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupView()
    }
    
    func setupView() {
        
        dataArray = dataForTableView.getDataFromModel()
        self.view.addSubview(topView)
        self.view.addSubview(tableView)
        
        topView.homeController = self
        topView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        topView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        topNavigationConstraint = topView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 88)
        topNavigationConstraint?.isActive = true
        
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    lazy var topView: TopView = {
        var top = TopView()
        top.translatesAutoresizingMaskIntoConstraints = false
        top.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return top
    }()
    
    lazy var tableView: UITableView = {
        
        var table = UITableView(frame: self.view.frame, style: .plain)
        table.dataSource = self
        table.delegate = self
        table.register(HomeCell.self, forCellReuseIdentifier:cellIdentifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    func reloadTableView(data: [DataModel]) {
        self.dataArray = data
        self.tableView.reloadData()
    }
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        switch toInterfaceOrientation {
        case .landscapeLeft, .landscapeRight:
            topNavigationConstraint?.constant = 30
        case .portrait:
            topNavigationConstraint?.constant = 88
        default:
            break
        }
    }
}
extension HomeController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeCell
        cell?.data = dataArray[indexPath.row]
        return cell!
    }
}


