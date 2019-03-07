//
//  Kata.swift
//  IaidoTracker
//
//  Created by Martin Pittenauer on 3/6/19.
//  Copyright © 2019 Martin Pittenauer. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class Katas {
    static let sharedInstance = Katas()

    let groups = ["Tōhō","Seiza","Battō Hō","Battō Hō Okuiai"]
    let wazas = [["Maegiri","Zengōgiri","Kiriage","Shihōgiri","Kissakigaeshi"],
                 ["Mae","Migi","Hidari","Ushiro","Yaegaki","Ukenagashi","Kaishaku","Tsukekomi","Tsukikage","Oikaze","Nukiuchi"],
                 ["Juntō sono Ichi","Juntō sono Ni","Tsuigekito","Shatō","Shihōtō sono Ichi","Shihōtō sono Ni","Zantotsutō"],
                 ["Zenteki Gyakutō","Tatekitō","Kōteki Gyakutō","Kōteki Nukiuchi"]]


    func managedObject(forKataWith name:String) -> NSManagedObject {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //let entity = NSEntityDescription.entity(forEntityName: "Kata", in: context)
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Kata")
        request.predicate = NSPredicate(format: "name = %@", name)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if (result.first != nil) {
                return result.first as! NSManagedObject
            }
            
        } catch {
            print("Failed")
        }
        
        let entity = NSEntityDescription.entity(forEntityName: "Kata", in: context)
        let newKata = NSManagedObject(entity: entity!, insertInto: context)
        newKata.setValue(name, forKey: "name")
        newKata.setValue(0, forKey: "count")
        newKata.setValue(Date(), forKey: "lastDate")
        
        return newKata
    }
    
    func counter(forKataWith name:String) -> Int {
        let kata = self.managedObject(forKataWith: name)
        return kata.value(forKey: "count") as! Int
    }
    
    func setCounter(forKataWith name:String, to value:Int) {
        let kata = self.managedObject(forKataWith: name)
        kata.setValue(value, forKey: "count")
        do {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            try context.save()
        } catch {
            print("Failed saving")
        }

    }

    func increaseCounter(forKataWith name:String) {
        self.setCounter(forKataWith: name, to:self.counter(forKataWith: name) + 1)
    }

    func decreaseCounter(forKataWith name:String) {
        self.setCounter(forKataWith: name, to:self.counter(forKataWith: name) - 1)
    }

    
}

