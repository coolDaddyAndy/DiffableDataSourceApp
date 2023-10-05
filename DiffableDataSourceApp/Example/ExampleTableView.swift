//
//  ExampleTableView.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 3.10.23.
//

import UIKit

final class ExampleTableView: UITableView {
    
    private var subscribeTypes: [ExampleRow] = [.subscribeType(SubscribeModel.betaSubs),
                                                .subscribeType(SubscribeModel.juniorSubs)]
    private var paymentTypes: [ExampleRow] = []
    private var discountTypes: [ExampleRow] = []

    private lazy var exampleDataSource = ExampleDataSource(tableView: self)
        
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        registerCell()
        applySnapshot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func registerCell() {
        register(SubscribeTableViewCell.self, forCellReuseIdentifier: SubscribeTableViewCell.cellID)
        register(PaymentTableViewCell.self, forCellReuseIdentifier: PaymentTableViewCell.cellID)
        register(DiscountTableViewCell.self, forCellReuseIdentifier: DiscountTableViewCell.cellID)
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<ExampleSection, ExampleRow>()
        snapshot.appendSections([.subscribeType, .payment, .discount])
        snapshot.appendItems(subscribeTypes, toSection: .subscribeType)
        snapshot.appendItems(paymentTypes, toSection: .payment)
        snapshot.appendItems(discountTypes, toSection: .discount)
        
        exampleDataSource.apply(snapshot, animatingDifferences: true)
    }
}
