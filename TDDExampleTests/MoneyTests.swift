//
//  MoneyTests.swift
//  TDDExampleTests
//
//  Created by HINOMORI HIROYA on 2018/09/20.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import XCTest

// TODO: [] $5 + 10CHF = $10
// TODO: [*] $5 * 2 = $10
// TODO: [*] amountをprivateにする
// TODO: [*] Dollarの副作用をどうする？
// TODO: [] Moneyの丸め処理どうする？
// TODO: [*] Equatable
// TODO: [] hashCode()
// TODO: [] nullとの等価性比較
// TODO: [] 他のオブジェクトとの等価性比較

class MoneyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMultiplication() {
        let five = Dollar(5)
        XCTAssertEqual(Dollar(10), five.times(2))
        XCTAssertEqual(Dollar(15), five.times(3))
    }
    
    func testEquality() {
        XCTAssertTrue(Dollar(5) == Dollar(5))
        XCTAssertFalse(Dollar(5) == Dollar(6))
    }
}
