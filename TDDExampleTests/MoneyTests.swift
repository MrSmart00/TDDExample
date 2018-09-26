//
//  MoneyTests.swift
//  TDDExampleTests
//
//  Created by HINOMORI HIROYA on 2018/09/20.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import XCTest

// TODO: [] $5 + 10CHF = $10
// TODO: [] $5 + $5 = $10
// TODO: [] $5 + $5がMoneyを返す
// TODO: [*] Bank.reduce(Money)
// TODO: [] Moneyを変換して換算を行う
// TODO: [] Reduce(Bank, String)

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
        XCTAssertFalse(Money.franc(5) == Money.dollar(5))
    }
    
    func testCurrency() {
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
    }
    
    func testSimpleAddition() {
        let five = Money.dollar(5)
        let sum = five.plus(five)
        let bank = Bank()
        let reduced = bank.reduce(sum, "USD")
        XCTAssert(Money.dollar(10) == reduced)
    }
    
    func testPlusReturnSum() {
        let five = Money.dollar(5)
        let result = five.plus(five)
        let sum = result as! Sum
        XCTAssert(five == sum.augend)
        XCTAssert(five == sum.addend)
    }
    
    func testReduceSum() {
        let sum: Expression = Sum(Money.dollar(3), Money.dollar(4))
        let bank = Bank()
        let result = bank.reduce(sum, "USD")
        XCTAssert(Money.dollar(7) == result)
    }
    
    func testReduceMoney() {
        let bank = Bank()
        let result = bank.reduce(Money.dollar(1), "USD")
        XCTAssert(Money.dollar(1) == result)
    }
}
