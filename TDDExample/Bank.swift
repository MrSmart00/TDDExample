//
//  Bank.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/26.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Bank {
    
    private var rates = [Pair: Int]()
    
    func reduce(_ source: Expression, _ to: String) -> Money {
        return source.reduce(self, to)
    }
    
    func addRate(_ from: String, _ to: String, _ rate: Int) {
        rates[Pair(from, to)] = rate
    }
    
    func rate(_ from: String, to: String) -> Int {
        guard from != to else { return 1 }
        return rates[Pair(from, to)] ?? 0
    }
}
