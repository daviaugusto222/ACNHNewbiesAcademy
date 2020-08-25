//
//  DescriptionTableViewCell.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 17/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var NPCImage: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var wrapperView: UIView!
    
    static let nibName = "DescriptionTableViewCell"
    static let identifier = "DescriptionTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    override func prepareForReuse() {
        super .prepareForReuse()
        NPCImage.image = nil
        nomeLabel.text = ""
        descriptionLabel.text = ""
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        self.wrapperView.layer.cornerRadius = 10
    }
    
    public func configure(with sideQuest: SideQuest) {
        NPCImage.image = UIImage(named: sideQuest.NPC.icon)
        nomeLabel.text = sideQuest.NPC.name
        descriptionLabel.text = sideQuest.description
    }
}
