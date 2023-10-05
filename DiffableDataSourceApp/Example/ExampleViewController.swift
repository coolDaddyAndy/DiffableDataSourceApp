//
//  ExampleViewController.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 3.10.23.
//

import UIKit

final class ExampleViewController: UIViewController {
    
    private let exampleTableView = ExampleTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        title = "DiffableDataSource"
        view.backgroundColor = .systemMint
        
        exampleTableView.frame = view.frame
        view.addSubview(exampleTableView)
    }
}
