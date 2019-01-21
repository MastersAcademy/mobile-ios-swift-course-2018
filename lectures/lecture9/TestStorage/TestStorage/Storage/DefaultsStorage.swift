//
//  DefaultsStorage.swift
//  TestStorage
//
//  Created by Maksym Savisko on 1/21/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

import Foundation

protocol DefaultsStorage: class, StoringProvidable, BoolStoringProvidable {}

class DefaultsStorageImpl: DefaultsStorage {
    private let storage: UserDefaultsDescribing
    
    init(storage: UserDefaultsDescribing = UserDefaults.standard) {
        self.storage = storage
    }
    
    func saveValue(_ value: String?, forKey key: String) throws {
        storage.set(value, forKey: key)
    }
    
    func saveData(_ data: Data?, forKey key: String) throws {
        storage.set(data, forKey: key)
    }
    
    func fetchValue(forKey key: String) throws -> String? {
        return storage.string(forKey: key)
    }
    
    func fetchData(forKey key: String) throws -> Data? {
        guard let value = storage.value(forKey: key) else { return nil }
        guard let data = value as? Data else { return nil }
        return data
    }
    
    func saveBool(_ value: Bool, forKey key: String) {
        storage.set(value, forKey: key)
    }
    
    func fetchBoolValue(forKey key: String) -> Bool {
        return storage.bool(forKey: key)
    }
}
