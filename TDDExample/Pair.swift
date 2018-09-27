//
//  Pair.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/26.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Pair: Hashable {
    
    var hashValue: Int = 0
    
    private var from: String
    private var to: String
    
    init(_ from: String, _ to: String) {
        self.from = from
        self.to = to
    }
    
    static func == (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to
    }

}
