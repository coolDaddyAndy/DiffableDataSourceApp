//
//  SecondViewController.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 2.10.23.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let secondTableView = SecondTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemMint
        
        secondTableView.frame = view.frame
        view.addSubview(secondTableView)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(leftAddTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(rightAddTapped))
    }
    
    @objc private func leftAddTapped() {
        let randomNumber = Int.random(in: 1...10)
        secondTableView.firstArray.append(Row(title: "Random number \(randomNumber)"))
        secondTableView.updateDiffableDataSource()
    }
    
    @objc private func rightAddTapped() {
        let randomNumber = Int.random(in: 1...10)
        secondTableView.secondArray.append(Row(title: "Random number \(randomNumber)"))
        secondTableView.updateDiffableDataSource()
    }
}
