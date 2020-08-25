//
//  SideQuestTableViewCell.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 14/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import UIKit

class SideQuestTableViewCell: UITableViewCell {

    @IBOutlet weak var backgraundImage: UIImageView!
    @IBOutlet weak var pinImage: UIImageView!
    @IBOutlet weak var doneImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var npcImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var namenpcLabel: UILabel!
    
    static let nibName = "SideQuestTableViewCell"
    static let identifier = "sideQuestCell"
    
    override func prepareForReuse() {
        backgraundImage.image = nil
        pinImage.image = nil
        doneImage.image = nil
        npcImage.image = nil
        titleLabel.text = ""
        descriptionLabel.text = ""
        namenpcLabel.text = ""
    }
    
    func configure(with sideQuest: SideQuest) {
        backgraundImage.image = (sideQuest.category == .fishing) ? UIImage(named: "Ocean") : UIImage(named: "Grass")
        pinImage.image = (sideQuest.category == .fishing) ? UIImage(named: "PinBlue") : UIImage(named: "PinGreen")
        doneImage.image = sideQuest.done ? UIImage(named: "DoneTrue") : UIImage(named: "DoneFalse")
        npcImage.image = UIImage(named: sideQuest.NPC.icon)
        
        titleLabel.text = sideQuest.title
        descriptionLabel.text = sideQuest.description
        namenpcLabel.text = sideQuest.NPC.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
