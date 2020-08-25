//
//  ItemDetailsViewController.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 20/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    var idSideQuest: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Fechar", style: .plain, target: self, action: #selector(closeAction))
        
    }
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
