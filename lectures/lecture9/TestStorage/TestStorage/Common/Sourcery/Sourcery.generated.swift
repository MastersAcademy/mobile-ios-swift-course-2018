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
class UserDefaultsDescribingMock: UserDefaultsDescribing {

    //MARK: - set

    var setForKeyCallsCount = 0
    var setForKeyCalled: Bool {
        return setForKeyCallsCount > 0
    }
    var setForKeyReceivedArguments: (value: Any?, defaultName: String)?
    var setForKeyClosure: ((Any?, String) -> Void)?

    func set(_ value: Any?, forKey defaultName: String) {
        setForKeyCallsCount += 1
        setForKeyReceivedArguments = (value: value, defaultName: defaultName)
        setForKeyClosure?(value, defaultName)
    }

    //MARK: - value

    var valueForKeyCallsCount = 0
    var valueForKeyCalled: Bool {
        return valueForKeyCallsCount > 0
    }
    var valueForKeyReceivedKey: String?
    var valueForKeyReturnValue: Any?
    var valueForKeyClosure: ((String) -> Any?)?

    func value(forKey key: String) -> Any? {
        valueForKeyCallsCount += 1
        valueForKeyReceivedKey = key
        return valueForKeyClosure.map({ $0(key) }) ?? valueForKeyReturnValue
    }

    //MARK: - string

    var stringForKeyCallsCount = 0
    var stringForKeyCalled: Bool {
        return stringForKeyCallsCount > 0
    }
    var stringForKeyReceivedDefaultName: String?
    var stringForKeyReturnValue: String?
    var stringForKeyClosure: ((String) -> String?)?

    func string(forKey defaultName: String) -> String? {
        stringForKeyCallsCount += 1
        stringForKeyReceivedDefaultName = defaultName
        return stringForKeyClosure.map({ $0(defaultName) }) ?? stringForKeyReturnValue
    }

    //MARK: - bool

    var boolForKeyCallsCount = 0
    var boolForKeyCalled: Bool {
        return boolForKeyCallsCount > 0
    }
    var boolForKeyReceivedDefaultName: String?
    var boolForKeyReturnValue: Bool!
    var boolForKeyClosure: ((String) -> Bool)?

    func bool(forKey defaultName: String) -> Bool {
        boolForKeyCallsCount += 1
        boolForKeyReceivedDefaultName = defaultName
        return boolForKeyClosure.map({ $0(defaultName) }) ?? boolForKeyReturnValue
    }

}
