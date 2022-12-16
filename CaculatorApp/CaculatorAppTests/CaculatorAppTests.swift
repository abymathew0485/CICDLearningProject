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
}

class CaculatorAppTests: XCTestCase {


    func test_addition_whenOnlyOneValue() {

        let sut = Calculator()

        sut.findSumOf(number1: 1, number2: 2)

        XCTAssertEqual(sut.result, 3)
    }


}
