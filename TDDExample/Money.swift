//
//  Money.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/20.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Money: Equatable {
    
    fileprivate var amount: Int = 0
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount
    }
    
}

class Dollar: Money {
    
    init(_ amount: Int) {
        super.init()
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Dollar {
        return Dollar(amount * multiplier)
    }
    
}

class Franc: Money {
    
    init(_ amount: Int) {
        super.init()
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Franc {
        return Franc(amount * multiplier)
    }
    
}

