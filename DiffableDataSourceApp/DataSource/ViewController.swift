//
//  ViewController.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 1.10.23.
//

import UIKit

final class ViewController: UIViewController {
    
    private let customTableView = CustomTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemMint
        
        customTableView.frame = view.frame
        view.addSubview(customTableView)
    }
}
