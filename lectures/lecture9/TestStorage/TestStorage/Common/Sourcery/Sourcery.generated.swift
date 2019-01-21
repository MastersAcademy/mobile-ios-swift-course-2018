// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif













class StringIdentifierProvidableMock: StringIdentifierProvidable {
    var identifier: String {
        get { return underlyingIdentifier }
        set(value) { underlyingIdentifier = value }
    }
    var underlyingIdentifier: String!

}
