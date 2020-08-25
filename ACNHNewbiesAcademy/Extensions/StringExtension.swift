//
//  StringExtension.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 22/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
