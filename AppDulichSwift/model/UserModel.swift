//
//  UserModel.swift
//  AppDulichSwift
//
//  Created by Sang on 18/06/2022.
//

import Foundation

struct UserModel{
    var userName : String!
    var id : Int!
    
    init(){
        self.userName = ""
        self.id = 0
    }
    
    init(name : String, id : Int){
        self.userName = name;
        self.id = id;
    }
    
    init(object : Any){
        guard let agrs = object as? Dictionary<String,Any> else{
            fatalError("Cannot convert object -> dictionary")
        }
        
        self.userName = agrs["login"] as? String
        self.id = agrs["id"] as? Int
    }
}
