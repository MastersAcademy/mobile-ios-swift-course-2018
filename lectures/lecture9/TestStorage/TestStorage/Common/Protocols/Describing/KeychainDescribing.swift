//
//  KeychainDescribing.swift
//  TestStorage
//
//  Created by Maksym Savisko on 1/21/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

import Foundation

internal protocol KeychainDescribing: class {
    // sourcery: methodName = "setString"
    func set(_ value: String, key: String) throws
    // sourcery: methodName = "setData"
    func set(_ value: Data, key: String) throws
    func getString(_ key: String) throws -> String?
    func getData(_ key: String) throws -> Data?
    func remove(_ key: String) throws
}
