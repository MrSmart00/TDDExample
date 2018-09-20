//
//  Franc.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/20.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Franc: Money {
    
    init(_ amount: Int) {
        super.init()
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Franc {
        return Franc(amount * multiplier)
    }
    
}
