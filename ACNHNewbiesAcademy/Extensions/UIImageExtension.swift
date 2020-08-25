//
//  UIImageExtension.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 14/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
    
        self.init(data: imageData)
    }

}
