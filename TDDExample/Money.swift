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
        return lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }
    
    static func dollar(_ amount: Int) -> Money {
        return Dollar(amount)
    }
    
    static func franc(_ amount: Int) -> Money {
        return Franc(amount)
    }
    
    func times(_ multiplier: Int) -> Money {
        return Money()
    }
}

class Dollar: Money {
    
    init(_ amount: Int) {
        super.init()
        self.amount = amount
    }
    
    override func times(_ multiplier: Int) -> Money {
        return Dollar(amount * multiplier)
    }
    
}

class Franc: Money {
    
    init(_ amount: Int) {
        super.init()
        self.amount = amount
    }
    
    override func times(_ multiplier: Int) -> Money {
        return Franc(amount * multiplier)
    }
    
}

