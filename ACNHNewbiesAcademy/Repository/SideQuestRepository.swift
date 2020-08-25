//
//  SideQuestRepository.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 19/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation
import UIKit

class SideQuestRepository {
    
    func getSideQuests(completion: @escaping ([SideQuest]?) -> Void) {
        
        let url = Bundle.main.url(forResource: "MockSideQuests", withExtension: "json")
        guard let data = try? Data(contentsOf: url!) else {
            fatalError("Ih rapaz")
        }
        
        do {
            let object = try JSONDecoder().decode([SideQuest].self, from: data)
            completion(object)
            
        } catch {
            print("DEU PAU")
        }
        
    }
}
