//
//  ModelManager.swift
//  ios DB Storage
//
//  Created by Nisha Raghu on 16/09/17
//  Copyright © 2017 Nisha Raghu. All rights reserved.
//

import Foundation


import UIKit

let sharedInstance = ModelManager()

class ModelManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> ModelManager
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "sqlitedb.sqlite"))
        }
        return sharedInstance
    }
    
    func addContactData(contactInfo: Contactlist) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO Info (Name, Location, Address, MobileNo, Email) VALUES (?, ?, ?, ?, ?)", withArgumentsIn: [contactInfo.Name, contactInfo.location, contactInfo.address, contactInfo.MobileNo, contactInfo.Email])
        sharedInstance.database!.close()
        print("Yay i'm added")
        return isInserted
    }
 
}
