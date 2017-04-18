//
//  CoreDataManager.swift
//  SimpleCoreData
//
//  Created by etudiant on 18/04/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    public static let shared = CoreDataManager()
    
    public var context : NSManagedObjectContext?
    
    private override init(){
        
        // JE get le shema
        guard let schema = Bundle.main.url(forResource: "SimpleCoreData", withExtension: "momd")
            else
        {
            return
        }
        //Je creer le model
        guard let model = NSManagedObjectModel(contentsOf: schema)else{
            return
        }
        //je Persiste les donnée
        let store = NSPersistentStoreCoordinator(managedObjectModel: model)
        do{
            try store.addPersistentStore(ofType : NSSQLiteStoreType,configurationName:nil, at: FileUtils.getDocumentFile(at: "sample.sqlite"),options : nil)}
        catch{
            print(error)
            return
        }
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = store
        self.context = context
    }
}
