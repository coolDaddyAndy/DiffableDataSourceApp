//
//  ExampleModels.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 3.10.23.
//

import Foundation


enum ExampleSection: CaseIterable {
    case subscribeType
    case payment
    case discount
}


enum ExampleRow: Hashable {
    case subscribeType(SubscribeModel)
    case payment(PaymentModel)
    case discount(DiscountModel)
}


struct SubscribeModel: Hashable {
    let image: String
    let name: String
    let description: String
    
    static let betaSubs: Self = .init(image: "Beta-subs",
                                      name: "beta",
                                      description: "Доступ к видео на 2 недели раньше, чем на YouTube")
    
    static let juniorSubs: Self = .init(image: "Junior-subs",
                                      name: "junior",
                                      description: "Чат, в котором можно задать вопрос по видео + файлы проекта")
}


struct PaymentModel: Hashable {
    let image: String
    let name: String
    
    static let visa: Self = .init(image: "visa", name: "Visa")
    static let masterCard: Self = .init(image: "mc", name: "MasterCard")
}


struct DiscountModel: Hashable {
    let image: String
    let name: String
}
