//
//  Idea+CoreDataClass.swift
//  Bloco de Ideias
//
//  Created by Ada 2018 on 11/06/2018.
//  Copyright © 2018 Academy. All rights reserved.
//
//

import Foundation
import CoreData


public class Idea: NSManagedObject {
    
    @objc
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    init(){
        let entity:NSEntityDescription = DataManager.getEntity(entity: "Idea")
        super.init(entity: entity, insertInto: nil)
    }
    
    class func entityDescription() -> (NSEntityDescription){
        let entity:NSEntityDescription = DataManager.getEntity(entity: "Idea")
        return entity
    }
    
    func save(){
        let context:NSManagedObjectContext = DataManager.getContext()
        
        if (!self.isInserted) {
            context.insert(self)
        }
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
}