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
// TODO: [*] 5CHF * 2 = 10CHF
// TODO: [] DollarとFrancの重複
// TODO: [*] Equatableの一般化
// TODO: [*] timesの一般化
// TODO: [*] FrancとDollarを比較する
// TODO: [*] 通貨の概念
// TODO: [] testFrancMultiplicationを削除する？

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
        let five = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10), five.times(2))
        XCTAssertEqual(Money.dollar(15), five.times(3))
    }
    
    func testEquality() {
        XCTAssertTrue(Money.dollar(5) == Money.dollar(5))
        XCTAssertFalse(Money.dollar(5) == Money.dollar(6))
        XCTAssertTrue(Money.franc(5) == Money.franc(5))
        XCTAssertFalse(Money.franc(5) == Money.franc(6))
        XCTAssertFalse(Money.franc(5) == Money.dollar(5))
    }
    
    func testFrancMultiplication() {
        let five = Money.franc(5)
        XCTAssertEqual(Money.franc(10), five.times(2))
        XCTAssertEqual(Money.franc(15), five.times(3))
    }
    
    func testCurrency() {
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
    }
    
    func testDifferentClassEquality() {
        XCTAssert(Money(10, "CHF") == Franc(10, "CHF"))
    }
    
}
