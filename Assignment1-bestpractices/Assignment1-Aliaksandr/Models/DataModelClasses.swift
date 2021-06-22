//
//  DataModelClasses.swift
//  Assignment1-Aliaksandr
//
//  Created by user182438 on 11/21/20.Amrinder Kaur
//  Copyright © 2020 user182483. All rights reserved.
//

import Foundation

class Course:Codable{
    var type : String
    var price : Double
    var amount : Int
}

class CoursePackage:Codable{
    var student : String
    var version : String
    var count : Int
    var data : [Course]
}
