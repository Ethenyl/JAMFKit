//
//  PackageTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class PackageTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Package/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Package.dmg"
    let defaultCategory = "Unknown"
    let defaultFilename = "Package.dmg"
    let defaultInformation = "information"
    let defaultNotes = "notes"
    let defaultPriority: UInt = 5
    let defaultIsRebootRequired = true
    let defaultShouldFillUserTemplate = true
    let defaultShouldFillExistingUsers = true
    let defaultIsBootVolumeRequired = true
    let defaultAllowsUninstallation = true
    let defaultOsRequirements = "requirement"
    let defaultRequiredProcessor = "None"
    let defaultSwitchWithPackage = "Do Not Install"
    let defaultShouldInstallIfReportedAvailable = true
    let defaultReinstallOption = "Do Not Reinstall"
    let defaultTriggeringFiles = "files"
    let defaultShouldSendNotificaton = true

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = Package(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = Package(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "package_valid", subfolder: subfolder)!

        let actualValue = Package(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Package][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.category, defaultCategory)
        XCTAssertEqual(actualValue?.filename, defaultFilename)
        XCTAssertEqual(actualValue?.information, defaultInformation)
        XCTAssertEqual(actualValue?.notes, defaultNotes)
        XCTAssertEqual(actualValue?.priority, defaultPriority)
        XCTAssertEqual(actualValue?.isRebootRequired, defaultIsRebootRequired)
        XCTAssertEqual(actualValue?.shouldFillUserTemplate, defaultShouldFillUserTemplate)
        XCTAssertEqual(actualValue?.shouldFillExistingUsers, defaultShouldFillExistingUsers)
        XCTAssertEqual(actualValue?.isBootVolumeRequired, defaultIsBootVolumeRequired)
        XCTAssertEqual(actualValue?.allowsUninstallation, defaultAllowsUninstallation)
        XCTAssertEqual(actualValue?.osRequirements, defaultOsRequirements)
        XCTAssertEqual(actualValue?.requiredProcessor, defaultRequiredProcessor)
        XCTAssertEqual(actualValue?.switchWithPackage, defaultSwitchWithPackage)
        XCTAssertEqual(actualValue?.shouldInstallIfReportedAvailable, defaultShouldInstallIfReportedAvailable)
        XCTAssertEqual(actualValue?.reinstallOption, defaultReinstallOption)
        XCTAssertEqual(actualValue?.triggeringFiles, defaultTriggeringFiles)
        XCTAssertEqual(actualValue?.shouldSendNotificaton, defaultShouldSendNotificaton)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "package_incomplete", subfolder: subfolder)!

        let actualValue = Package(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Package][\(defaultIdentifier) - Package.dmg]")
        XCTAssertEqual(actualValue?.category, "")
        XCTAssertEqual(actualValue?.filename, "")
        XCTAssertEqual(actualValue?.information, "")
        XCTAssertEqual(actualValue?.notes, "")
        XCTAssertEqual(actualValue?.priority, 0)
        XCTAssertEqual(actualValue?.isRebootRequired, false)
        XCTAssertEqual(actualValue?.shouldFillUserTemplate, false)
        XCTAssertEqual(actualValue?.shouldFillExistingUsers, false)
        XCTAssertEqual(actualValue?.isBootVolumeRequired, false)
        XCTAssertEqual(actualValue?.allowsUninstallation, false)
        XCTAssertEqual(actualValue?.osRequirements, "")
        XCTAssertEqual(actualValue?.requiredProcessor, "")
        XCTAssertEqual(actualValue?.switchWithPackage, "")
        XCTAssertEqual(actualValue?.shouldInstallIfReportedAvailable, false)
        XCTAssertEqual(actualValue?.reinstallOption, "")
        XCTAssertEqual(actualValue?.triggeringFiles, "")
        XCTAssertEqual(actualValue?.shouldSendNotificaton, false)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "package_invalid", subfolder: subfolder)!

        let actualValue = Package(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "package_valid", subfolder: subfolder)!

        let actualValue = Package(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 19)

        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.category.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.filename.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.information.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.notes.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.priority.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.rebootRequired.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.fillUserTemplate.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.fillExistingUsers.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.bootVolumeRequired.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.allowUninstalled.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.osRequirements.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.requiredProcessor.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.switchWithPackage.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.installIfReportedUnavailable.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.reinstallOption.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.triggeringFiles.rawValue])
        XCTAssertNotNil(encodedObject?[Package.CodingKeys.sendNotification.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "package_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(Package.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.description, "[Package][\(defaultIdentifier) - \(defaultName)]")
            XCTAssertEqual(actualValue.category, defaultCategory)
            XCTAssertEqual(actualValue.filename, defaultFilename)
            XCTAssertEqual(actualValue.information, defaultInformation)
            XCTAssertEqual(actualValue.notes, defaultNotes)
            XCTAssertEqual(actualValue.priority, defaultPriority)
            XCTAssertEqual(actualValue.isRebootRequired, defaultIsRebootRequired)
            XCTAssertEqual(actualValue.shouldFillUserTemplate, defaultShouldFillUserTemplate)
            XCTAssertEqual(actualValue.shouldFillExistingUsers, defaultShouldFillExistingUsers)
            XCTAssertEqual(actualValue.isBootVolumeRequired, defaultIsBootVolumeRequired)
            XCTAssertEqual(actualValue.allowsUninstallation, defaultAllowsUninstallation)
            XCTAssertEqual(actualValue.osRequirements, defaultOsRequirements)
            XCTAssertEqual(actualValue.requiredProcessor, defaultRequiredProcessor)
            XCTAssertEqual(actualValue.switchWithPackage, defaultSwitchWithPackage)
            XCTAssertEqual(actualValue.shouldInstallIfReportedAvailable, defaultShouldInstallIfReportedAvailable)
            XCTAssertEqual(actualValue.reinstallOption, defaultReinstallOption)
            XCTAssertEqual(actualValue.triggeringFiles, defaultTriggeringFiles)
            XCTAssertEqual(actualValue.shouldSendNotificaton, defaultShouldSendNotificaton)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "package_valid", subfolder: subfolder)!

        let actualValue = Package(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
