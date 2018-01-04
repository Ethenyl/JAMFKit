//
//  SMTPServer.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

/// Represents a physical SMTP server, contains information about the server and it's configuration.
public final class SMTPServer: Identifiable, CustomStringConvertible {

    // MARK: - Constants

    static let EnabledKey = "enabled"
    static let HostKey = "host"
    static let PortKey = "port"
    static let TimeoutKey = "timeout"
    static let AuthorizationRequiredKey = "authorization_required"
    static let UsernameKey = "username"
    static let PasswordKey = "password"
    static let SslKey = "ssl"
    static let TlsKey = "tls"
    static let SendFromNameKey = "send_from_name"
    static let SendFromEmailKey = "send_from_email"

    // MARK: - Properties

    public var isEnabled: Bool
    public var host: String
    public var port: UInt
    public var timeout: UInt
    public var isAuthorizationRequired: Bool
    public var username: String
    public var password: String
    public var isSSLEnabled: Bool
    public var isTLSEnabled: Bool
    public var sendFromName: String
    public var sendFromEmail: String

    public var description: String {
        let baseDescription = "[\(String(describing: SMTPServer.self))]"

        if !host.isEmpty, port > 0 {
            return "\(baseDescription)[\(host):\(port)]"
        }

        return baseDescription
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        isEnabled = json[SMTPServer.EnabledKey] as? Bool ?? false
        host = json[SMTPServer.HostKey] as? String ?? ""
        port = json[SMTPServer.PortKey] as? UInt ?? 0
        timeout = json[SMTPServer.TimeoutKey] as? UInt ?? 0
        isAuthorizationRequired = json[SMTPServer.AuthorizationRequiredKey] as? Bool ?? false
        username = json[SMTPServer.UsernameKey] as? String ?? ""
        password = json[SMTPServer.PasswordKey] as? String ?? ""
        isSSLEnabled = json[SMTPServer.SslKey] as? Bool ?? false
        isTLSEnabled = json[SMTPServer.TlsKey] as? Bool ?? false
        sendFromName = json[SMTPServer.SendFromNameKey] as? String ?? ""
        sendFromEmail = json[SMTPServer.SendFromEmailKey] as? String ?? ""
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[SMTPServer.EnabledKey] = isEnabled
        json[SMTPServer.HostKey] = host
        json[SMTPServer.PortKey] = port
        json[SMTPServer.TimeoutKey] = timeout
        json[SMTPServer.AuthorizationRequiredKey] = isAuthorizationRequired
        json[SMTPServer.UsernameKey] = username
        json[SMTPServer.PasswordKey] = password
        json[SMTPServer.SslKey] = isSSLEnabled
        json[SMTPServer.TlsKey] = isTLSEnabled
        json[SMTPServer.SendFromNameKey] = sendFromName
        json[SMTPServer.SendFromEmailKey] = sendFromEmail

        return json
    }
}
