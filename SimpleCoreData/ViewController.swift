//
//  ViewController.swift
//  SimpleCoreData
//
//  Created by etudiant on 18/04/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = FileUtils.getDocumentFile(at: "bonjour.txt")
        print(url)
        FileManager.default.createFile(atPath: url.path, contents: nil, attributes: nil)
        if let context = CoreDataManager.shared.context{
            print(context)
            
            // CREATION
            
            let p = Person(context: context);
            p.firstName = "julien"
            p.lastName = "coeurvolan"
            try! context.save()
            
            // RECUPERATION
            let fr: NSFetchRequest<Person> = Person.fetchRequest()
            let f = try! context.fetch(fr)

            print(f)
            // on peut utiliser NSpredicate
            
            
        }else{
            print("Error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        


    }
    

}

