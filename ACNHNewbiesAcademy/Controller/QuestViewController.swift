//
//  QuestViewController.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 12/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController {
    
    @IBOutlet weak var sideQuestTableView: UITableView!
    
    let nameSections = ["Objetivos Diários", "Missões Secundárias"]
    
    private var sideQuests: [SideQuest] = [] {
        didSet {
            DispatchQueue.main.async {
                self.sideQuestTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideQuestTableView.backgroundColor = .clear
        
        SideQuestRepository().getSideQuests() { [weak self] (sideQuests) in
            guard let sideQuests = sideQuests else {
                return
            }
            self?.sideQuests = sideQuests }
        
        //AnimalRepository().getAllAnimals()
        
        configureTable()
        setupTableView()
    }
    
    private func configureTable() {
        let sidequestNib = UINib(nibName: SideQuestTableViewCell.nibName, bundle: nil)
        sideQuestTableView.register(sidequestNib, forCellReuseIdentifier: SideQuestTableViewCell.identifier)
        
        let goalNib = UINib(nibName: GoalTableViewCell.nibName, bundle: nil)
        sideQuestTableView.register(goalNib, forCellReuseIdentifier: GoalTableViewCell.identifier)
    }
    
    fileprivate func setupTableView() {
        sideQuestTableView.estimatedSectionHeaderHeight = CGFloat.leastNormalMagnitude
        sideQuestTableView.estimatedSectionFooterHeight = CGFloat.leastNormalMagnitude
        sideQuestTableView.sectionFooterHeight = CGFloat.leastNormalMagnitude
        sideQuestTableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    
}

extension QuestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        let title = UILabel()
        
        if section == 0 {
            title.frame = CGRect(x: 16, y: 35, width: 375, height: 20)
            view.addSubview(title)
        } else {
            title.frame = CGRect(x: 16, y: 15, width: 375, height: 20)
            view.addSubview(title)
        }
        
        title.font = sfRounded(size: 17, weight: .semibold)
        title.text = nameSections[section]
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : sideQuests.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 70.0 : 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = sideQuestTableView.dequeueReusableCell(withIdentifier: GoalTableViewCell.identifier, for: indexPath) as? GoalTableViewCell else {
                fatalError("Wrong identifier")
            }
            cell.backgroundColor = .clear
            
            cell.update()
            
            return cell
            
        } else {
            
            guard let cell = sideQuestTableView.dequeueReusableCell(withIdentifier: SideQuestTableViewCell.identifier, for: indexPath) as? SideQuestTableViewCell else {
                fatalError("Wrong identifier")
            }
            
            cell.backgroundColor = .clear
            cell.configure(with: sideQuests[indexPath.row])
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return 110
        }
        
        return 273
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            let selectedSideQuest = sideQuests[indexPath.row]
            
            if let sideQuestDetails = UIStoryboard(name: "SideQuestDetailsView", bundle: nil).instantiateViewController(identifier: "SideQuestDetailsView") as? SideQuestDetailsViewController {
                sideQuestDetails.sideQuest = selectedSideQuest
                navigationController?.pushViewController(sideQuestDetails, animated: true)
            }
        }
        
    }
    
}
