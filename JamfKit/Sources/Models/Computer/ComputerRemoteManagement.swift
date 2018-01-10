//
//  ComputerRemoteManagement.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import Foundation

@objc(JMFKComputerRemoteManagement)
public final class ComputerRemoteManagement: NSObject, Identifiable {

    // MARK: - Constants

    static let ManagedKey = "managed"
    static let ManagementUsernameKey = "management_username"

    // MARK: - Properties

    @objc
    public var isManaged: Bool

    @objc
    public var managementUsername: String

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        isManaged = json[ComputerRemoteManagement.ManagedKey] as? Bool ?? false
        managementUsername = json[ComputerRemoteManagement.ManagementUsernameKey] as? String ?? ""
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerRemoteManagement.ManagedKey] = isManaged
        json[ComputerRemoteManagement.ManagementUsernameKey] = managementUsername

        return json
    }
}
