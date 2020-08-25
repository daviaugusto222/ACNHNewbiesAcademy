//
//  URLExtension.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 17/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

extension URL {
    
    static func getFishId(withID idFish: Int) -> URL {
        URL(string: "https://acnhapi.com/v1/fish/\(idFish)")!
    }
    
    static func getAllFishs() -> URL {
        URL(string: "https://acnhapi.com/v1/fish/")!
    }
}
