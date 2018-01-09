//
//  ComputerGroupTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class ComputerGroupTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerGroup/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "computers"
    let defaultIsSmart = true

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_group_valid", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerGroup][12345. computers]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertEqual(actualValue?.criteria.count, 1)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.computers)
        XCTAssertEqual(actualValue?.computers.count, 1)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "computer_group_invalid", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromInvalidCriterionJSON() {
        let payload = self.payload(for: "computer_group_invalid_criterion", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerGroup][12345. computers]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertEqual(actualValue?.criteria.count, 0)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.computers)
        XCTAssertEqual(actualValue?.computers.count, 1)
    }

    func testShouldInitializeFromInvalidMobileDeviceJSON() {
        let payload = self.payload(for: "computer_group_invalid_computer", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerGroup][12345. computers]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertEqual(actualValue?.criteria.count, 1)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.computers)
        XCTAssertEqual(actualValue?.computers.count, 0)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = ComputerGroup(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_group_valid", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 6)
        XCTAssertNotNil(encodedObject?[ComputerGroup.IdentifierKey])
        XCTAssertNotNil(encodedObject?[ComputerGroup.NameKey])
        XCTAssertNotNil(encodedObject?[ComputerGroup.IsSmartKey])
        XCTAssertNotNil(encodedObject?[ComputerGroup.CriteriaKey])
        XCTAssertNotNil(encodedObject?[ComputerGroup.SiteKey])
        XCTAssertNotNil(encodedObject?[ComputerGroup.ComputersKey])
    }
}
