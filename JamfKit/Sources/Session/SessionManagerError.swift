//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKSessionManagerErrorCode)
public enum SessionManagerErrorCode: Int {
    /// The configuration is missing either the JSS host's URL or the login / password
    case incompleteHostConfiguration

    /// The supplied URL for the JSS host is not a valid URL
    case invalidURL

    /// The supplied credentials (either the username or the password) are not valid
    case invalidCredentials

    /// The supplied [host | username & password] pair is not valid
    case invalidConfiguration

    /// The host is not configured
    case missingHostConfiguration
}

@objc(JMFKSessionManagerError)
public class SessionManagerError: NSError {

    // MARK: - Initialization

    convenience init(code: SessionManagerErrorCode) {
        self.init(domain: Constants.domain, code: code.rawValue)
    }
}
