//
//  Dollar.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/20.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Dollar: Equatable {
    
    private var amount: Int = 0
    
    init(_ amount: Int) {
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Dollar {
        return Dollar(amount * multiplier)
    }
    
    static func == (lhs: Dollar, rhs: Dollar) -> Bool {
        return lhs.amount == rhs.amount
    }

}
