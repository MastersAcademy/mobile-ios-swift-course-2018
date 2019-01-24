//
//  SecureStorage.swift
//  TestStorage
//
//  Created by Maksym Savisko on 1/21/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

import KeychainAccess

protocol SecureStorage: class, StringIdentifierProvidable, StoringProvidable {}

class SecureStorageImpl: SecureStorage {
    let identifier: String
    private let storage: KeychainDescribing
    
    init(identifier: String,
         storage: KeychainDescribing) {
        self.identifier = identifier
        self.storage = storage
    }
    
    func saveValue(_ value: String?, forKey key: String) throws {
        if let validValue = value {
            try storage.set(validValue, key: key)
        } else {
            try storage.remove(key)
        }
    }
    
    func saveData(_ data: Data?, forKey key: String) throws {
        if let validData = data {
            try storage.set(validData, key: key)
        } else {
            try storage.remove(key)
        }
    }
    
    func fetchValue(forKey key: String) throws -> String? {
        return try storage.getString(key)
    }
    
    func fetchData(forKey key: String) throws -> Data? {
        return try storage.getData(key)
    }
}

