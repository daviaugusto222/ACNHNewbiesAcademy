//
//  NPC.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 13/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

struct NPC: Codable {
    let name: String
    let icon: String
    
    static func createNPC() -> NPC {
        return NPC(name: "Isabelle", icon: "isabelle")
    }
}
