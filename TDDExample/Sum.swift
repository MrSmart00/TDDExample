//
//  Sum.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/26.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Sum: Expression {
    
    var augend: Expression
    var addend: Expression
    init(_ augend: Expression, _ addend: Expression) {
        self.augend = augend
        self.addend = addend
    }

    func times(_ multiplier: Int) -> Expression {
        return Sum(augend.times(multiplier), addend.times(multiplier))
    }
    
    func plus(_ addend: Expression) -> Expression {
        return Sum(self, addend)
    }

    func reduce(_ bank: Bank, _ to: String) -> Money {
        let amount = augend.reduce(bank, to).amount + addend.reduce(bank, to).amount
        return Money(amount, to)
    }
}
