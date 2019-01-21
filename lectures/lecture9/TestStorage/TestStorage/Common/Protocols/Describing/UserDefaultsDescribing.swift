//
//  UserDefaultsDescribing.swift
//  TestStorage
//
//  Created by Maksym Savisko on 1/21/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

internal protocol UserDefaultsDescribing: class {
    func set(_ value: Any?, forKey defaultName: String)
    func value(forKey key: String) -> Any?
    func string(forKey defaultName: String) -> String?
    func bool(forKey defaultName: String) -> Bool
}
