//
//  FileUtils.swift
//  SimpleCoreData
//
//  Created by etudiant on 18/04/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import UIKit

class FileUtils: NSObject {
    class func getDocumentDirectory() -> URL {
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0]
    }
    class func getDocumentFile(at path: String)-> URL{
        let parent = self.getDocumentDirectory()
        return parent.appendingPathComponent(path)
    }
}
