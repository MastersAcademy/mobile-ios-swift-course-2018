//
//  StringIdentifierProvidable.swift
//  TestStorage
//
//  Created by Maksym Savisko on 1/21/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

protocol StringIdentifierProvidable {
    var identifier: String { get }
}

// sourcery:begin: AutoMockable
extension StringIdentifierProvidable {}
// sourcery:end
