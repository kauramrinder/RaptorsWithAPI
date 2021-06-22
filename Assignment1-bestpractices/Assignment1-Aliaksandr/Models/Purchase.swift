//
//  Purchase.swift
//  Assignment1-Aliaksandr
//
//  Created by user182483 on 10/21/20.
//  Copyright © 2020 user182483. All rights reserved.
//

import Foundation

class Purchase: Ticket {
    var date: Date
    
    override init(t: String, p: Double, a: Int) {
        self.date = Date()
        super.init(t: t, p: p, a: a)
    }
}
