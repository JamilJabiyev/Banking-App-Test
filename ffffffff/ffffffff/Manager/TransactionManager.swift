//
//  TransactionManager.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 21.08.23.
//

import Foundation

struct TransactionManager {
    
    static var shared = TransactionManager()
    
    var list: [TransactionDetails] = [
        .init(image: Images.getImage(type: .avatar1), name: "Avarat", transerMoney: 120),
        .init(image: Images.getImage(type: .avatar1), name: "Avarat", transerMoney: 120),
        .init(image: Images.getImage(type: .avatar1), name: "Avarat", transerMoney: 120),
        .init(image: Images.getImage(type: .avatar1), name: "Avarat", transerMoney: 120),
        .init(image: Images.getImage(type: .avatar1), name: "Avarat", transerMoney: 120)
    ]
    
    mutating func addItem(_ item: TransactionDetails) {
        list.insert(item, at: 0)
    }
}
