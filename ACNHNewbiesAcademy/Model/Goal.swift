//
//  Goal.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 13/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

struct Goal {
    let icon: String
    var quantity: Int
    let total: Int
    var done: Bool
    
    static func createGoals() -> [Goal] {
        let goals = [Goal(icon: "Fossils", quantity: 0, total: 4, done: false),
                     Goal(icon: "BellsTree", quantity: 0, total: 1, done: false),
                     Goal(icon: "Rocks", quantity: 0, total: 6, done: false),
                     Goal(icon: "DIY", quantity: 0, total: 1, done: false),
                     Goal(icon: "Villagers", quantity: 0, total: 10, done: false)]
        return goals
    }
}
