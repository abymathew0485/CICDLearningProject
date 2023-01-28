//
//  DetailsViewControllerTests.swift
//  CaculatorAppTests
//
//  Created by Aby Mathew on 25/12/22.
//

import XCTest
@testable import CaculatorApp



class DetailsViewControllerTests: XCTestCase {

    func test_memoryLeackages() {
        let sut = DetailsViewController()
        var delegateMockObject: DetailsViewControllerDelegateMock?  = DetailsViewControllerDelegateMock()
        sut.delegate = delegateMockObject

        delegateMockObject = nil
        XCTAssertNil(sut.delegate)
    }


    //MARK: -- Helpers --

    private class DetailsViewControllerDelegateMock : DetailsViewControllerDelegate {
        func showAlert(message: String) {

        }
    }
}
