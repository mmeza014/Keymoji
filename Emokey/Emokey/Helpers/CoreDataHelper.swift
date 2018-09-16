//
//  CoreDataHelper.swift
//  Emokey
//
//  Created by Nicole Meza Sanchez on 9/16/18.
//  Copyright © 2018 ShellHacks. All rights reserved.
//

import Foundation

import UIKit

import CoreData



struct CoreDataHelper {
    
    static let context: NSManagedObjectContext = {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
            fatalError()
            
        }
        
        
        
        let persistentContainer = appDelegate.persistentContainer
        
        let context = persistentContainer.viewContext
        
        
        
        return context
        
    }()
    
    
    
    static func newPassword() -> CoreDataPassword {
        
        let password = NSEntityDescription.insertNewObject(forEntityName: "CoreDataPassword", into: context) as! CoreDataPassword
        
        
        
        return password
        
    }
    
    
    
    static func save() {
        
        do {
            
            try context.save()
            
        } catch let error {
            
            print("Could not save \(error.localizedDescription)")
            
        }
        
    }
    
    
    
    static func delete(Password: CoreDataPassword) {
        
        context.delete(Password)
        
        
        
        save()
        
    }
    
    
    
    static func retrievePasswords() -> [CoreDataPassword] {
        
        do {
            
            let fetchRequest = NSFetchRequest<CoreDataPassword>(entityName: "CoreDataPassword")
            
            let results = try context.fetch(fetchRequest)
            
            
            
            return results
            
        } catch let error {
            
            print("Could not fetch \(error.localizedDescription)")
            
            
            
            return []
            
        }
        
    }
    
}
