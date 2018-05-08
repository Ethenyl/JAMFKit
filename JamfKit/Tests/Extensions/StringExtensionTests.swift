//
//  StringExtensionTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class StringExtensionTests: XCTestCase {

    // MARK: - Tests

    func testShouldReturnCleanedUpKey() {
        let actualValue = ComputerGeneral.CodingKeys.serialNumber.rawValue.asCleanedKey()

        XCTAssertEqual(actualValue, ComputerGeneral.CodingKeys.serialNumber.rawValue.replacingOccurrences(of: "_", with: ""))
    }
}
