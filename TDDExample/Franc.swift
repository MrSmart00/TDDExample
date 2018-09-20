//
//  Franc.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/20.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Franc: Equatable {
    
    private var amount: Int = 0
    
    init(_ amount: Int) {
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Franc {
        return Franc(amount * multiplier)
    }
    
    static func == (lhs: Franc, rhs: Franc) -> Bool {
        return lhs.amount == rhs.amount
    }
    
}

