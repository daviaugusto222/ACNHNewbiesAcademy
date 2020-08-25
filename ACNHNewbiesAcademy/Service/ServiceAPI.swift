//
//  ServiceAPI.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 17/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

enum ServiceApi: Router {
    case fishId

    var hostname: String {
        get {
            return "https://acnhapi.com/v1"
        }
    }
    
    var url: URL? {
        get {
            switch self {
            case .fishId: return URL(string: "\(hostname)/fish/")
            
            }
        }
    }
}
