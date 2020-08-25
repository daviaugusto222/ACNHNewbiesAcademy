//
//  ItemTableViewCell.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 17/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var doneImage: UIImageView!
    @IBOutlet weak var wrapperView: UIView!
    
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let nibName = "ItemTableViewCell"
    static let identifier = "ItemTableViewCell"
    
    var onTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        let preArrowImage: UIImageView = doneImage // also give it frame
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        preArrowImage.isUserInteractionEnabled = true
        preArrowImage.addGestureRecognizer(singleTap)
        
    }
    
    override func prepareForReuse() {
        super .prepareForReuse()
        
        itemImage.image = nil
        doneImage.image = nil
        nomeLabel.text = ""
        availabilityLabel.text = ""
        priceLabel.text = ""
        
    }

    override func layoutSubviews() {
        super .layoutSubviews()
        self.wrapperView.layer.cornerRadius = 10
        self.priceView.layer.cornerRadius = 10
    }

    //Action
    @objc func tapDetected() {
        onTap?()
    }
    
//    public func configure(with item: Item) {
//        itemImage.image = try? UIImage(withContentsOfUrl: URL(string: item.iconUrl)!)
//        doneImage.image = UIImage(named: item.status ? "Done" : "NotDone")
//        nomeLabel.text = item.name
//        availabilityLabel.text = item.availability
//        priceLabel.text = String(item.price)
//    }
    
    public func configureAnimal(with animal: Animal, onTap: @escaping () -> Void) {
        self.onTap = onTap
        if let icon = animal.dataIcon {
            itemImage.image = UIImage(data: icon)
        } else {
            itemImage.image = UIImage(named: "DoneFalse")
        }
        let statusAnimal = animal.status ?? false
        doneImage.image = UIImage(named: statusAnimal ? "Done" : "NotDone")
        nomeLabel.text = animal.name.nameEUde.capitalizingFirstLetter()
        availabilityLabel.text = "Disponível entre: \(animal.availability.timeArray.first ?? 0)h e \(animal.availability.timeArray.last ?? 0)h"
        priceLabel.text = String(animal.price)
        
    }

}
