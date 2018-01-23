//
//  Wage.swift
//  window-shopper
//
//  Created by George Buckley on 23/01/2018.
//  Copyright © 2018 George Buckley. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
