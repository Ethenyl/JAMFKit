//
//  NetbootServer.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

/// Represents a physical netboot server, contains information about the server and it's configuration.
public final class NetbootServer: BaseObject {

    // MARK: - Constants

    static let IpAddressKey = "ip_address"
    static let DefaultImageKey = "default_image"
    static let SpecificImageKey = "specific_image"
    static let TargetPlatformKey = "target_platform"
    static let SharePointKey = "share_point"
    static let SetKey = "set"
    static let ImageKey = "image"
    static let ProtocolKey = "protocol"
    static let ConfigureManuallyKey = "configure_manually"
    static let BootArgumentsKey = "boot_args"
    static let BootFileKey = "boot_file"
    static let BootDeviceKey = "boot_device"

    // MARK: - Properties

    public var ipAddress: String
    public var isDefaultImage: Bool
    public var isSpecificImage: Bool
    public var targetPlatform: String
    public var sharePoint: String
    public var set: String
    public var image: String
    public var filesystemProtocol: String
    public var configureManually: Bool
    public var bootArguments: String
    public var bootFile: String
    public var bootDevice: String

    public override var description: String {
        return "[\(String(describing: NetbootServer.self))][\(identifier). \(self.ipAddress)]"
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        ipAddress = json[NetbootServer.IpAddressKey] as? String ?? ""
        isDefaultImage = json[NetbootServer.DefaultImageKey] as? Bool ?? false
        isSpecificImage = json[NetbootServer.SpecificImageKey] as? Bool ?? false
        targetPlatform = json[NetbootServer.TargetPlatformKey] as? String ?? ""
        sharePoint = json[NetbootServer.SharePointKey] as? String ?? ""
        set = json[NetbootServer.SetKey] as? String ?? ""
        image = json[NetbootServer.ImageKey] as? String ?? ""
        filesystemProtocol = json[NetbootServer.ProtocolKey] as? String ?? ""
        configureManually = json[NetbootServer.ConfigureManuallyKey] as? Bool ?? false
        bootArguments = json[NetbootServer.BootArgumentsKey] as? String ?? ""
        bootFile = json[NetbootServer.BootFileKey] as? String ?? ""
        bootDevice = json[NetbootServer.BootDeviceKey] as? String ?? ""

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[NetbootServer.IpAddressKey] = ipAddress
        json[NetbootServer.DefaultImageKey] = isDefaultImage
        json[NetbootServer.SpecificImageKey] = isSpecificImage
        json[NetbootServer.TargetPlatformKey] = targetPlatform
        json[NetbootServer.SharePointKey] = sharePoint
        json[NetbootServer.SetKey] = set
        json[NetbootServer.ImageKey] = image
        json[NetbootServer.ProtocolKey] = filesystemProtocol
        json[NetbootServer.ConfigureManuallyKey] = configureManually
        json[NetbootServer.BootArgumentsKey] = bootArguments
        json[NetbootServer.BootFileKey] = bootFile
        json[NetbootServer.BootDeviceKey] = bootDevice

        return json
    }
}
