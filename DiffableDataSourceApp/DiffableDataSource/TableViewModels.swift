//
//  TableViewModels.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 2.10.23.
//

import Foundation


enum Section {
    case first
    case second
}

struct Row: Hashable {
    let title: String
    var uuid = UUID()
}


// Duplicated identifiers fix

extension Row: Codable {
    
    static func == (lhs: Row, rhs: Row) -> Bool {
            return lhs.uuid == rhs.uuid
        }

    func hash(into hasher: inout Hasher) {
            hasher.combine(uuid)
        }
}
