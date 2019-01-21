//
//  StorageKey.swift
//  TestStorage
//
//  Created by Maksym Savisko on 1/21/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

struct StorageKey: RawRepresentable {
    typealias RawValue = String
    var rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
