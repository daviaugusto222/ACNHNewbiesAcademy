//
//  Animal.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 17/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

struct Animal: Codable {
    
    let idAnimal: Int
    let fileName: String
    let name: Names
    var price: Int
    let iconURI: String
    var dataIcon: Data?
    var status: Bool?
    let availability: Availability
    
    private enum CodingKeys: String, CodingKey {
           case idAnimal = "id", fileName = "file-name", price, iconURI = "icon_uri", dataIcon, status, name, availability
    }
    
}

struct Names: Codable {
    let nameEUde: String
    
    private enum CodingKeys: String, CodingKey {
        case nameEUde = "name-USen"
    }
}

struct Availability: Codable {
    let monthNorthern: String
    let timeArray: [Int]
    
    private enum CodingKeys: String, CodingKey {
        case monthNorthern = "month-northern", timeArray = "time-array"
    }
}
