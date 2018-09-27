//
//  Expression.swift
//  TDDExample
//
//  Created by HINOMORI HIROYA on 2018/09/26.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

protocol Expression {
    func times(_ multiplier: Int) -> Expression
    func plus(_ addend: Expression) -> Expression
    func reduce(_ bank: Bank, _ to: String) -> Money
}
