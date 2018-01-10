//
//  MobileDeviceGroup.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

/// Represents a group of mobile devices managed by Jamf, contains grouping information.
@objc(JMFKMobileDeviceGroup)
public final class MobileDeviceGroup: HardwareGroup {

    // MARK: - Constants

    static let MobileDevicesKey = "mobile_devices"

    // MARK: - Properties

    @objc
    public var mobileDevices: [MobileDeviceGeneral]

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        mobileDevices = MobileDeviceGroup.parseMobileDevices(json: json)

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        if !mobileDevices.isEmpty {
            json[MobileDeviceGroup.MobileDevicesKey] = mobileDevices.map { mobileDevice -> [String: [String: Any]] in
                return ["mobile_device": mobileDevice.toJSON()]
            }
        }

        return json
    }

    private static func parseMobileDevices(json: [String: Any]) -> [MobileDeviceGeneral] {
        return BaseObject.parseElements(from: json, nodeKey: MobileDeviceGroup.MobileDevicesKey, singleNodeKey: "mobile_device")
    }
}