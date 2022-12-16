//
//  CaculatorAppTests.swift
//  CaculatorAppTests
//
//  Created by Aby Mathew on 16/12/22.
//

import XCTest
@testable import CaculatorApp

final class Calculator {

    var result: Double = 0.0

    public func findSumOf(number1: Double, number2: Double) {
        result = number1 + number2
    }

    public func findSubstractionOf(number1: Double, number2: Double) {
        result = number1 - number2
    }
}

class CaculatorAppTests: XCTestCase {


    func test_addition_whenOnlyOneValue() {

        let sut = Calculator()

        sut.findSumOf(number1: 1, number2: 0)

        XCTAssertEqual(sut.result, 1)
    }

    func test_addition_successWithTwoValues() {

        let sut = Calculator()

        sut.findSumOf(number1: 1, number2: 2)

        XCTAssertEqual(sut.result, 3)
    }


//
//    func test_addition_whenOnlyOneValue() {
//
//        let sut = Calculator()
//
//        sut.findSubstractionOf(number1: 3, number2: 1)
//
//        XCTAssertEqual(sut.result, 2)
//    }





}
