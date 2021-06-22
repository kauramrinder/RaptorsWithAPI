//
//  History.swift
//  Assignment1-Aliaksandr
//
//  Created by user182483 on 10/21/20.
//  Copyright © 2020 user182483. All rights reserved.
//

import Foundation

class History{
    var purchases = [Purchase]()
    
    func addPurchase(purchase: Purchase) {
        purchases.append(purchase)
    }
}
