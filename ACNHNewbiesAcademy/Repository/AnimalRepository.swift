//
//  AnimalRepository.swift
//  ACNHNewbiesAcademy
//
//  Created by David Augusto on 17/08/20.
//  Copyright © 2020 David Augusto. All rights reserved.
//

import Foundation

class AnimalRepository {
    
    var animals: [Animal] = []
    
    func getAnimal(idAnimal: Int, completion: @escaping (Animal?) -> Void) {
        //verificar se existe localmente com FileManager
        //se sim completion(Dado) e retorna
        //se nao,
        //faz requisicao web para pegar o dado, e retorna a devida completion para todos os casos
        //se dados forem retornados com sucesso pela API, persistir eles.
        if let data = FileHelper().retrieveFile(at: "\(idAnimal)") {
            if let animal: Animal = try? JSONDecoder().decode(Animal.self, from: data) {
                completion(animal)
            }
        } else {
            HTTP.get.request(url: URL.getFishId(withID: idAnimal)) { data, response, error in
                if let error = error {
                    print(error)
                    completion(nil)
                    return
                }
                
                guard let data = data, let response = response else {
                    completion(nil)
                    return
                }
                
                switch response.statusCode {
                case 200:
                    var animal: Animal = (try? JSONDecoder().decode(Animal.self, from: data))!
                    let urlIcon = URL(string: animal.iconURI)
                    animal.dataIcon = try? Data(contentsOf: urlIcon!)
                    self.createNewAnimal(newItem: animal)
                    completion(animal)
                    return
                    
                default:
                    completion(nil)
                    return
                }
            }
        }
    }
    func updateAnimal(animal: Animal) {
        if let data = try? JSONEncoder().encode(animal) {
            //overrite persisted file
            FileHelper().updateFile(at: String(animal.idAnimal), data: data)
        }
    }
    @discardableResult
    func readSQAnimals(listId: [Int]) -> [Animal] {
        
        for idAnimal in listId {
            
            if let data = FileHelper().retrieveFile(at: "\(idAnimal)") {
                if let animal = try? JSONDecoder().decode(Animal.self, from: data) {
                    animals.append(animal)
                }
            }
        }
        return animals
    }
    
    @discardableResult
    func createNewAnimal(newItem: Animal) -> Animal? {
        //persist file
        if let data = try? JSONEncoder().encode(newItem) {
            FileHelper().createFile(with: data, name: String(newItem.idAnimal))
            return newItem
        }
        return nil
    }
    
    func readAllAnimals() -> [Animal] {
        
        //read the content of the documents path
        let fileNames: [String] = FileHelper().contentsForDirectory(atPath: "")
        
        //retrieve items from fileNames and updating items array
        self.animals = fileNames.compactMap { fileName in
            if let data = FileHelper().retrieveFile(at: fileName) {
                //decode from Data type to Item type
                let animal = try? JSONDecoder().decode(Animal.self, from: data)
                return animal
            }
            return nil
        }
        return animals
    }
}
