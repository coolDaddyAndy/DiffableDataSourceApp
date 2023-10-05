//
//  SecondTableView.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 2.10.23.
//

import UIKit

final class SecondTableView: UITableView {
    
    var diffableDataSource: UITableViewDiffableDataSource<Section, Row>?
    
    var firstArray: [Row] = []
    var secondArray: [Row] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setupDiffableDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupDiffableDataSource() {
        diffableDataSource = UITableViewDiffableDataSource(tableView: self,
                                                           cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = itemIdentifier.title
            return cell
        })
    }
    
    func updateDiffableDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Row>()
        snapshot.appendSections([.first, .second])
        snapshot.appendItems(firstArray, toSection: .first)
        snapshot.appendItems(secondArray, toSection: .second)
        
        diffableDataSource?.apply(snapshot, animatingDifferences: true)
    }
}

