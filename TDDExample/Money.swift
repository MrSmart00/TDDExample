//
//  Money.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/20.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Money: Expression, Equatable {
    
    private(set) var amount: Int = 0
    private(set) var currency: String
    
    init(_ amount: Int, _ currency: String) {
        self.amount = amount
        self.currency = currency
    }

    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
    }
    
    static func dollar(_ amount: Int) -> Money {
        return Money(amount, "USD")
    }
    
    static func franc(_ amount: Int) -> Money {
        return Money(amount, "CHF")
    }
    
    func times(_ multiplier: Int) -> Expression {
        return Money(amount * multiplier, currency)
    }

    func plus(_ addend: Expression) -> Expression {
        return Sum(self, addend)
    }
    
    func reduce(_ bank: Bank, _ to: String) -> Money {
        let rate = bank.rate(currency, to: to)
        return Money(amount / rate, to)
    }
}
