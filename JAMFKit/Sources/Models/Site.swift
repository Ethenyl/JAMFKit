//
//  Site.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

/// Represents a physical location (building, office, etc.).
public final class Site: BaseObject {

    // MARK: - Properties

    public override var description: String {
        return "[\(String(describing: Site.self))][\(identifier). \(self.name)]"
    }
}
