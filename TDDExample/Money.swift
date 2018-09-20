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
    fileprivate(set) var currency: String?
    
    init(_ amount: Int, _ currency: String?) {
        self.amount = amount
        self.currency = currency
    }

    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }
    
    static func dollar(_ amount: Int) -> Money {
        return Dollar(amount, "USD")
    }
    
    static func franc(_ amount: Int) -> Money {
        return Franc(amount, "CHF")
    }
    
    func times(_ multiplier: Int) -> Money {
        return Money(0, nil)
    }

}

class Dollar: Money {
    
    override func times(_ multiplier: Int) -> Money {
        return Money.dollar(amount * multiplier)
    }
    
}

class Franc: Money {
    
    override func times(_ multiplier: Int) -> Money {
        return Money.franc(amount * multiplier)
    }
    
}

