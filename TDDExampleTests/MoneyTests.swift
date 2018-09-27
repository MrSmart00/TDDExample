//
//  MoneyTests.swift
//  TDDExampleTests
//
//  Created by HINOMORI HIROYA on 2018/09/20.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import XCTest

// TODO: [*] $5 + 10CHF = $10
// TODO: [*] $5 + $5 = $10
// TODO: [] $5 + $5がMoneyを返す
// TODO: [*] Bank.reduce(Money)
// TODO: [*] Moneyを変換して換算を行う
// TODO: [*] Reduce(Bank, String)
// TODO: [*] Sum.plus
// TODO: [*] Expression.times

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
        XCTAssertEqual(Money.dollar(10), five.times(2) as! Money)    // MARK: Swiftではclassとprotocolの比較はできない
        XCTAssertEqual(Money.dollar(15), five.times(3) as! Money)    // MARK: Swiftではclassとprotocolの比較はできない
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
        XCTAssertEqual(Money.dollar(10), reduced)
    }
    
    func testPlusReturnSum() {
        let five = Money.dollar(5)
        let result = five.plus(five)
        let sum = result as! Sum
        XCTAssertEqual(five, sum.augend as! Money)  // MARK: Swiftではclassとprotocolの比較はできない
        XCTAssertEqual(five, sum.addend as! Money)  // MARK: Swiftではclassとprotocolの比較はできない
    }
    
    func testReduceSum() {
        let sum: Expression = Sum(Money.dollar(3), Money.dollar(4))
        let bank = Bank()
        let result = bank.reduce(sum, "USD")
        XCTAssertEqual(Money.dollar(7), result)
    }
    
    func testReduceMoney() {
        let bank = Bank()
        let result = bank.reduce(Money.dollar(1), "USD")
        XCTAssertEqual(Money.dollar(1), result)
    }
    
    func testReduceMoneyDifferentCurrency() {
        let bank = Bank()
        bank.addRate("CHF", "USD", 2)
        let result = bank.reduce(Money.franc(2), "USD")
        XCTAssertEqual(Money.dollar(1), result)
    }
    
    func testIdentityRate() {
        XCTAssertEqual(1, Bank().rate("USD", to: "USD"))
    }
    
    func testMixedAddition() {
        let fiveBucks = Money.dollar(5)
        let tenFrancs = Money.franc(10)
        let bank = Bank()
        bank.addRate("CHF", "USD", 2)
        let result = bank.reduce(fiveBucks.plus(tenFrancs), "USD")
        XCTAssertEqual(Money.dollar(10), result)
    }
    
    func testSumPlusMoney() {
        let fiveBacks = Money.dollar(5)
        let tenFrancs = Money.franc(10)
        let bank = Bank()
        bank.addRate("CHF", "USD", 2)
        let sum = Sum(fiveBacks, tenFrancs).plus(fiveBacks)
        let result = bank.reduce(sum, "USD")
        XCTAssertEqual(Money.dollar(15), result)
    }
    
    func testSumTimes() {
        let fiveBacks = Money.dollar(5)
        let tenFrancs = Money.franc(10)
        let bank = Bank()
        bank.addRate("CHF", "USD", 2)
        let sum = Sum(fiveBacks, tenFrancs).times(2)
        let result = bank.reduce(sum, "USD")
        XCTAssertEqual(Money.dollar(20), result)
    }
    
    // FIXME: ちょっとこのテストだけ意味わかんない。。
    // なんでSumとMoneyが同じクラスになるのか...？
//    func testPlusSameCurrencyReturnsMoney() {
//        let sum = Money.dollar(1).plus(Money.dollar(1))
//        XCTAssertTrue(sum is Money)
//    }
}
