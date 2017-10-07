//
//  DBManager.swift
//  ios DB Storage
//
//  Created by Nisha Raghu on 18/09/17.
//  Copyright © 2017 Nisha Raghu. All rights reserved.
//

import UIKit

class DBManager: NSObject {

    static let shared: DBManager = DBManager()

    let databaseFileName = "database.sqlite"
    
    var pathToDatabase: String!
    
    var database: FMDatabase!
    let field_contactID = "contactID"
    let field_name = "name"
    let field_location = "location"
    let field_address = "address"
    let field_phone = "phone"
    let field_email = "email"
    
    override init() {
        super.init()
        
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
    }
    
    func createDatabase() -> Bool {
        var created = false
        
        if !FileManager.default.fileExists(atPath: pathToDatabase) {
            database = FMDatabase(path: pathToDatabase!)
            
            if database != nil {
                // Open the database.
                if database.open() {
                    let createMoviesTableQuery = "create table storage (\(field_contactID) integer primary key autoincrement not null, \(field_name) text not null, \(field_location) text, \(field_address) text, \(field_phone) integer, \(field_email) text)"
                    
                    do {
                        try database.executeUpdate(createMoviesTableQuery, values: nil)
                        created = true
                    }
                    catch {
                        print("Could not create table.")
                        print(error.localizedDescription)
                    }
                    
                    // At the end close the database.
                    database.close()
                }
                else {
                    print("Could not open the database.")
                }
            }
        }
        
        return created
    }
}
