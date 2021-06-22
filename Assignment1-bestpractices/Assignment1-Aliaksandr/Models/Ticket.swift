//
//  Ticket.swift
//  Assignment1-Aliaksandr
//
//  Created by user182483 on 10/14/20.
//  Copyright © 2020 user182483. All rights reserved.
//

import Foundation

class Ticket {
   
    var type: String
    var price: Double
    var amount: Int
    
    init (t:String,p:Double,a:Int){
        type = t
        price = p
        amount = a
    }
    
    func buyTicket(q:Int) -> Bool{
        if amount>=q {
            amount -= q
            return true
        }
        return false
    }
    
    func reset(q:Int){
        amount = q
    }
}

