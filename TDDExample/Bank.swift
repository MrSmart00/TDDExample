//
//  Bank.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/26.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Bank {
    
    func reduce(_ source: Expression, _ to: String) -> Money {
        return source.reduce(to)
    }
}
