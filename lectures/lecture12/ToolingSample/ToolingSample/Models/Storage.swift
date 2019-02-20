//
//  Storage.swift
//  ToolingSample
//
//  Created by Maksym Savisko on 2/12/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

protocol Storage: class {
    func save()
    func fetch() -> String?
}

// sourcery:begin: AutoMockable
extension Storage {}
// sourcery:end
