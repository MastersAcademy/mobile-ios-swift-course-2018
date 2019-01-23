//
//  DefaultsStorageTests.swift
//  TestStorageUnitTests
//
//  Created by Maksym Savisko on 1/23/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

import XCTest
@testable import TestStorage

class DefaultsStorageTests: XCTestCase {

    private var storage: DefaultsStorageImpl!
    private var defaultsManualMock: UserDefaultsDescribingManualMock!
    private var defaultsMock: UserDefaultsDescribingMock!
    
    override func setUp() {
        defaultsManualMock = UserDefaultsDescribingManualMock()
        defaultsMock = UserDefaultsDescribingMock()
        storage = DefaultsStorageImpl(storage: defaultsManualMock)
    }

    override func tearDown() {
        defaultsManualMock = nil
        storage = nil
    }
    
    func testSaveValueForKey() {
        // Given
        let value = "Test"
        let key = "testKey"
        
        //When
        do {
            try storage.saveValue(value,
                                  forKey: key)
        } catch {
            XCTFail("Could not save value for key")
        }
        
        //Then
        XCTAssertTrue(defaultsManualMock.setValueCallsCount == 1)
        XCTAssertNotNil(defaultsManualMock.setValueReceivedValue)
        let receivedValue = defaultsManualMock
            .setValueReceivedValue as? String
        XCTAssertNotNil(receivedValue)
        XCTAssertEqual(receivedValue, value)
        XCTAssertNotNil(defaultsManualMock.setValueReceivedDefaultName)
        XCTAssertEqual(defaultsManualMock.setValueReceivedDefaultName!,
                       key)
    }
    
    func testSaveValueForKeyNilValue() {
        // Given
        storage = DefaultsStorageImpl(storage: defaultsMock)
        let key = "testKey"
        
        //When
        do {
            try storage.saveValue(nil,
                                  forKey: key)
        } catch {
            XCTFail("Could not save value for key")
        }
        
        //Then
        XCTAssertTrue(defaultsMock.setForKeyCallsCount == 1)
        XCTAssertNotNil(defaultsMock.setForKeyReceivedArguments)
        XCTAssertNil(defaultsMock.setForKeyReceivedArguments!.value)
        let receivedKey = defaultsMock.setForKeyReceivedArguments!
            .defaultName
        XCTAssertNotNil(receivedKey)
        XCTAssertEqual(receivedKey,
                       key)
    }
}

private class UserDefaultsDescribingManualMock: UserDefaultsDescribing {
    var setValueReceivedValue: Any?
    var setValueReceivedDefaultName: String?
    var setValueCallsCount: Int = 0
    
    func set(_ value: Any?,
             forKey defaultName: String) {
        setValueReceivedValue = value
        setValueReceivedDefaultName = defaultName
        setValueCallsCount += 1
    }
    
    func value(forKey key: String) -> Any? {
        return nil
    }
    
    func string(forKey defaultName: String) -> String? {
        return ""
    }
    
    func bool(forKey defaultName: String) -> Bool {
        return true
    }
    
    
}
