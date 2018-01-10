//
//  User.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import Foundation

/// Represents a Jamf user and contains the identification properties that are required to contact the actual user and identify the hardware devices assigned to him / her.
@objc(JMFKUser)
public final class User: BaseObject {

    // MARK: - Constants

    static let FullNameKey = "full_name"
    static let EmailKey = "email"
    static let EmailAddressKey = "email_address"
    static let PhoneNumberKey = "phone_number"
    static let PositionKey = "position"
    static let EnableCustomPhotoURLKey = "enable_custom_photo_url"
    static let CustomPhotoURLKey = "custom_photo_url"
    static let SitesKey = "sites"

    // MARK: - Properties

    @objc
    public var fullName: String

    @objc
    public var email: String

    @objc
    public var emailAddress: String

    @objc
    public var phoneNumber: String

    @objc
    public var position: String

    @objc
    public var enableCustomPhotoURL: Bool

    @objc
    public var customPhotoURL: String

    @objc
    public var sites: [Site]

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(identifier) - \(self.fullName)]"
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        fullName = json[User.FullNameKey] as? String ?? ""
        email = json[User.EmailKey] as? String ?? ""
        emailAddress = json[User.EmailAddressKey] as? String ?? ""
        phoneNumber = json[User.PhoneNumberKey] as? String ?? ""
        position = json[User.PositionKey] as? String ?? ""
        enableCustomPhotoURL = json[User.EnableCustomPhotoURLKey] as? Bool ?? false
        customPhotoURL = json[User.CustomPhotoURLKey] as? String ?? ""

        var sites = [Site]()
        if let rawSites = json[User.SitesKey] as? [[String: Any]] {
            sites = rawSites.flatMap { Site(json: $0) }
        } else if
            let rawSite = json[User.SitesKey] as? [String: Any],
            let site = Site(json: rawSite) {
            sites.append(site)
        }

        self.sites = sites

        super.init(json: json)
    }

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[User.FullNameKey] = fullName
        json[User.EmailKey] = email
        json[User.EmailAddressKey] = emailAddress
        json[User.PhoneNumberKey] = phoneNumber
        json[User.PositionKey] = position
        json[User.EnableCustomPhotoURLKey] = enableCustomPhotoURL
        json[User.CustomPhotoURLKey] = customPhotoURL

        if !sites.isEmpty {
            json[User.SitesKey] = sites.map { site -> [String: [String: Any]] in
                return ["site": site.toJSON()]
            }
        }

        return json
    }
}