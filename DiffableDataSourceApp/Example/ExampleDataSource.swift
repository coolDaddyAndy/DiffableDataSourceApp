//
//  ExampleDataSource.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 3.10.23.
//

import UIKit

final class ExampleDataSource: UITableViewDiffableDataSource<ExampleSection, ExampleRow> {
    
    init(tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .subscribeType(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: SubscribeTableViewCell.cellID,
                                                         for: indexPath) as? SubscribeTableViewCell
                cell?.configure(model)
                return cell
            case .payment(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: PaymentTableViewCell.cellID,
                                                         for: indexPath) as? PaymentTableViewCell
                cell?.configure(model)
                return cell ?? UITableViewCell()
            case .discount(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTableViewCell.cellID,
                                                         for: indexPath) as? DiscountTableViewCell
                cell?.configure(model)
                return cell
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header = ExampleSection.allCases[section]
        
        switch header {
        case .subscribeType:
            return "Suscribe"
        case .payment:
            return "Payment"
        case .discount:
            return "Discount"
        }
    }
}
