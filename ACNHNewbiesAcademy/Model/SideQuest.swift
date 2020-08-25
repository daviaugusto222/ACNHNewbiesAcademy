//
//  SideQuest.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 13/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

struct SideQuest: Decodable {
    let idSideQuest: Int?
    let title: String
    let description: String
    var done: Bool
    let category: Category
    let NPC: NPC
    let animals: [Int]?
    let items: [Int]?

    private enum CodingKeys: String, CodingKey {
           case idSideQuest, title, description, done, category, NPC, animals, items
    }
}
