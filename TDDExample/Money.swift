//
//  Money.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/20.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Money: Equatable {
    
    var amount: Int = 0
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount
    }
    
}
