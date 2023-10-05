//
//  CustomTableView.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 2.10.23.
//

import UIKit

final class CustomTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        register(UITableViewCell.self, forCellReuseIdentifier: "firstCell")
        register(UITableViewCell.self, forCellReuseIdentifier: "secondCell")
        
        dataSource = self
    }
}

//MARK: - UITableViewDataSource


extension CustomTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 3 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
            cell.textLabel?.text = "First"
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
            cell.textLabel?.text = "Second"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "First section" : "Second section"
    }
}
