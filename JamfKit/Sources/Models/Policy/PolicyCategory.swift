//
//  PolicyCategory.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

@objc(JMFKPolicyCategory)
public final class PolicyCategory: BaseObject {

    // MARK: - Constants

    static let PriorityKey = "priority"

    // MARK: - Properties

    @objc
    public var priority: UInt

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        guard let priority = json[PolicyCategory.PriorityKey] as? UInt else {
            return nil
        }

        self.priority = priority

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[PolicyCategory.PriorityKey] = priority

        return json
    }
}
