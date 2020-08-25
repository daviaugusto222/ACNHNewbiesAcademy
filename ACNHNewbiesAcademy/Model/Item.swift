//
//  Item.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 13/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let idItem: Int?
    let name: String
    let price: Int
    let availability: String
    let iconUrl: String
    var status: Bool
    
    static func createItem() -> Item {
        return Item(idItem: nil, name: "Sea Bass C+", price: 1200, availability: "9-14h", iconUrl: "https://acnhapi.com/v1/icons/fish/1", status: true)
    }
    
    private enum CodingKeys: String, CodingKey {
           case idItem, name, price, availability, iconUrl, status
    }
}
