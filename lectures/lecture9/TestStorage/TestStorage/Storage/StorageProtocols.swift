//
//  StorageProtocols.swift
//  TestStorage
//
//  Created by Maksym Savisko on 1/21/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

import Foundation

protocol StoringProvidable {
    func saveValue(_ value: String?, forKey key: String) throws
    func saveData(_ data: Data?, forKey key: String) throws
    func fetchValue(forKey key: String) throws -> String?
    func fetchData(forKey key: String) throws -> Data?
}

protocol BoolStoringProvidable {
    func saveBool(_ value: Bool, forKey key: String)
    func fetchBoolValue(forKey key: String) -> Bool
}
