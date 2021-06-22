//
//  Inventory.swift
//  Assignment1-Aliaksandr
//
//  Created by user182483 on 10/14/20.
//  Copyright © 2020 user182483. All rights reserved.
//

import Foundation

class Inventory {
    var tickets: [Ticket] = []
    
    init(){
        tickets.append(Ticket(t:"Balcony level",p:1170,a:20))
        tickets.append(Ticket(t: "Lower level",p: 10434,a:40))
        tickets.append(Ticket(t: "Courtside", p: 27777,a:30))
    }
}
