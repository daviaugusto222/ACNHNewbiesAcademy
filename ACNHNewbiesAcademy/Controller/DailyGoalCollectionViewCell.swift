//
//  DailyGoalCollectionViewCell.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 13/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import UIKit

class DailyGoalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgraundImage: UIImageView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    
    static let nibName = "DailyGoalCollectionViewCell"
    static let identifier = "DailyGoalCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super .prepareForReuse()
        backgraundImage.image = nil
        itemImage.image = nil
        progressLabel.text = ""
    }
    
    public func configure(with goal: Goal) {
        let done = goal.done ? "GoalDone" : "GoalNotDone"
        backgraundImage.image = UIImage(named: done)
        itemImage.image = UIImage(named: goal.icon)
        progressLabel.text = "\(goal.quantity)/\(goal.total)"
    }
    
}
