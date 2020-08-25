//
//  SideQuestDetailsViewController.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 17/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import UIKit

class SideQuestDetailsViewController: UIViewController {
    
    var idSideQuest: Int?
    
    var sideQuest: SideQuest?
    
    @IBOutlet weak var tableView: UITableView!
    
    //    var animals: [Animal] = [] {
    //        didSet {
    //            DispatchQueue.main.async {
    //                self.tableView.reloadData()
    //            }
    //        }
    //    }
    
    var animals: [Animal] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = sideQuest?.title
        
        self.loadAnimals()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dicas", style: .plain, target: self, action: #selector(dicasAction))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configureTable()
    }
    
    @objc func dicasAction() {
        
        let idSideQuest = sideQuest?.idSideQuest
        
        if let dicasDetails = UIStoryboard(name: "ItemDetailsView", bundle: nil).instantiateViewController(identifier: "ItemDetailsView") as? ItemDetailsViewController {
            dicasDetails.idSideQuest = idSideQuest
            let dicasNavigationController = UINavigationController(rootViewController: dicasDetails)
            dicasNavigationController.navigationBar.standardAppearance.configureWithTransparentBackground()
            navigationController?.present(dicasNavigationController, animated: true, completion: nil)
        }
    }
    
    func loadAnimals() {
        
        for idAnimal in sideQuest?.animals ?? [] {
            AnimalRepository().getAnimal(idAnimal: idAnimal) { [weak self](animal) in
                self?.animals.append(animal!)
            }
        }
    }
    
    func changeStatus(selectedAnimal: Int) {
        
        self.animals[selectedAnimal].status = true
       
        //animals[selectedAnimal].price = 0
        self.tableView.reloadData()
        AnimalRepository().updateAnimal(animal: animals[selectedAnimal])
        
    }
    
    private func configureTable() {
        let descriptionNib = UINib(nibName: DescriptionTableViewCell.nibName, bundle: nil)
        tableView.register(descriptionNib, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        
        let itemNib = UINib(nibName: ItemTableViewCell.nibName, bundle: nil)
        tableView.register(itemNib, forCellReuseIdentifier: ItemTableViewCell.identifier)
        
    }
}

extension SideQuestDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : animals.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        let title = UILabel()
        let subTitle = UITextView()
        
        if section == 0 {
//            title.frame = CGRect(x: 16, y: 35, width: 375, height: 20)
//            view.addSubview(title)
        } else {
            title.frame = CGRect(x: 16, y: 0, width: 375, height: 20)
            
            subTitle.frame = CGRect(x: 16, y: 20, width: Int(self.tableView.frame.size.width)-32, height: 55)
//            title.backgroundColor = .red
            subTitle.backgroundColor = .clear
            subTitle.isScrollEnabled = false
            
            subTitle.isEditable = false
            subTitle.isSelectable = false
            subTitle.allowsEditingTextAttributes = false
            
//            view.backgroundColor = .green
            
            view.addSubview(title)
            view.addSubview(subTitle)
        }
        
        title.font = sfRounded(size: 17, weight: .semibold)
        title.text = "Itens da Missão"
        subTitle.font = sfRounded(size: 15, weight: .regular)
        subTitle.text = "Colete todos os item abaixo para finalizar essa missão!"
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 30.0 : 70.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as? DescriptionTableViewCell else {
                fatalError("Wrong identifier")
            }
            cell.backgroundColor = .clear
            
            cell.configure(with: sideQuest!)
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell else {
                fatalError("Wrong identifier")
            }
            cell.backgroundColor = .clear
            
            cell.configureAnimal(with: animals[indexPath.row], onTap: { self.changeStatus(selectedAnimal: indexPath.row) })
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return 220
        }
        
        return 129
    }
}
