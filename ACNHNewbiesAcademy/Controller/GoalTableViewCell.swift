//
//  GoalTableViewCell.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 14/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import UIKit

class GoalTableViewCell: UITableViewCell {
   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var wrapperView: UIView!
    
    static let nibName = "GoalTableViewCell"
    static let identifier = "GoalTableViewCell"
    
    var goals: [Goal] = Goal.createGoals() {
        didSet { update() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.selectionStyle = .none
        
        let goalNib = UINib(nibName: DailyGoalCollectionViewCell.nibName, bundle: nil)
        collectionView.register(goalNib, forCellWithReuseIdentifier: DailyGoalCollectionViewCell.identifier)
        
        //Long press recognizer on GOALS
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.collectionView.addGestureRecognizer(lpgr)
        
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        self.wrapperView.layer.cornerRadius = 22
        
    }
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            return
        }

        let pgest = gestureReconizer.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: pgest)

        if let index = indexPath {
            goals[index.row].done = false
            goals[index.row].quantity = 0
        } else {
            print("Could not find index path")
        }
    }
    
    func update() {
        self.collectionView.reloadData()
    }
    
}

extension GoalTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 5
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyGoalCollectionViewCell.identifier, for: indexPath) as? DailyGoalCollectionViewCell else {
        fatalError("Wrong Identifier")
        }
        cell.configure(with: goals[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //return CGSize(width: wrapperView.frame.width/6.3, height: wrapperView.frame.height/1.4)
        return CGSize(width: 52, height: 66)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //var currentItem = goals[indexPath.row]
        
        if goals[indexPath.row].quantity < goals[indexPath.row].total {
            goals[indexPath.row].quantity += 1
        }
        if goals[indexPath.row].quantity == goals[indexPath.row].total {
            goals[indexPath.row].done = true
        }
    }
}
