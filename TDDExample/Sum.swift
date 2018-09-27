//
//  Sum.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/26.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Sum: Expression {
    var augend: Money
    var addend: Money
    init(_ augend: Money, _ addend: Money) {
        self.augend = augend
        self.addend = addend
    }
    
    func reduce(_ bank: Bank, _ to: String) -> Money {
        let amount = augend.amount + addend.amount
        return Money(amount, to)
    }
}
