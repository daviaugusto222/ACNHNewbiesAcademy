//
//  Font.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 17/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

import UIKit

func sfRounded(size: CGFloat, weight: UIFont.Weight) -> UIFont {
    
    let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
    let descriptor = systemFont.fontDescriptor.withDesign(.rounded)
    
    let roundedFont = UIFont(descriptor: descriptor!, size: size)
    
    return roundedFont
}
