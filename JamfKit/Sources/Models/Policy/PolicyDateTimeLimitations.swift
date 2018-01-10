//
//  PolicyDateTimeLimitations.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

@objc(JMFKPolicyDateTimeLimitations)
public final class PolicyDateTimeLimitations: NSObject, Identifiable {

    // MARK: - Constants

    static let ActivationDateKey = "activation_date"
    static let ExpirationDateKey = "expiration_date"
    static let NoExecuteOnKey = "no_execute_on"
    static let NoExecuteStartKey = "no_execute_start"
    static let NoExecuteEndKey = "no_execute_end"

    // MARK: - Properties

    @objc
    public var activationDate: PreciseDate?

    @objc
    public var expirationDate: PreciseDate?

    @objc
    public var noExecutionOn: [String: String]

    @objc
    public var noExecutionStart: String

    @objc
    public var noExecutionEnd: String

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        activationDate = PreciseDate(json: json, node: PolicyDateTimeLimitations.ActivationDateKey)
        expirationDate = PreciseDate(json: json, node: PolicyDateTimeLimitations.ExpirationDateKey)
        noExecutionOn = json[PolicyDateTimeLimitations.NoExecuteOnKey] as? [String: String] ?? [String: String]()
        noExecutionStart = json[PolicyDateTimeLimitations.NoExecuteStartKey] as? String ?? ""
        noExecutionEnd = json[PolicyDateTimeLimitations.NoExecuteEndKey] as? String ?? ""
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        if let activationDate = activationDate {
            json.merge(activationDate.toJSON()) { (_, new) in new }
        }

        if let expirationDate = expirationDate {
            json.merge(expirationDate.toJSON()) { (_, new) in new }
        }

        if !noExecutionOn.isEmpty {
            json[PolicyDateTimeLimitations.NoExecuteOnKey] = noExecutionOn
        }

        json[PolicyDateTimeLimitations.NoExecuteStartKey] = noExecutionStart
        json[PolicyDateTimeLimitations.NoExecuteEndKey] = noExecutionEnd

        return json
    }
}
