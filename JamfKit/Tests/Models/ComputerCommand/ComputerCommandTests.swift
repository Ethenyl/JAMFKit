//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerCommandTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerCommand/"
    let defaultCommand = "command"
    let defaultPasscode: UInt = 123456

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = ComputerCommand(command: defaultCommand, passcode: defaultPasscode)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.general.command, defaultCommand)
        XCTAssertEqual(actualValue?.general.passcode, defaultPasscode)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = ComputerCommand(command: "", passcode: defaultPasscode)

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_command", subfolder: subfolder)!

        let actualValue = ComputerCommand(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerCommand][\(defaultCommand)]")
        XCTAssertEqual(actualValue?.general.command, defaultCommand)
        XCTAssertEqual(actualValue?.general.passcode, defaultPasscode)
        XCTAssertEqual(actualValue?.computers.count, 1)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "computer_command_incomplete", subfolder: subfolder)!

        let actualValue = ComputerCommand(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerCommand][\(defaultCommand)]")
        XCTAssertEqual(actualValue?.general.command, defaultCommand)
        XCTAssertEqual(actualValue?.general.passcode, defaultPasscode)
        XCTAssertEqual(actualValue?.computers.count, 0)
    }

    func testShouldInitializeFromInvalidJSON() {
        let payload = self.payload(for: "computer_command_invalid", subfolder: subfolder)!

        let actualValue = ComputerCommand(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_command", subfolder: subfolder)!

        let actualValue = ComputerCommand(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
        XCTAssertNotNil(encodedObject?[ComputerCommand.GeneralKey])
        XCTAssertNotNil(encodedObject?[ComputerCommand.ComputersKey])

        let generalNode = encodedObject?[ComputerCommand.GeneralKey] as! [String: Any]
        XCTAssertNotNil(generalNode[ComputerCommandGeneral.CommandKey])
        XCTAssertNotNil(generalNode[ComputerCommandGeneral.PasscodeKey])

        let computersNode = encodedObject?[ComputerCommand.ComputersKey] as! [[String: [String: UInt]]]
        XCTAssertEqual(computersNode.count, 1)
        XCTAssertEqual(computersNode[0]["computer"]!["id"], 1)
    }
}
