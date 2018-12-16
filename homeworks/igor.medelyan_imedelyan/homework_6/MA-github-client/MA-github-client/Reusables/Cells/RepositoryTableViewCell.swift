//
//  RepositoryTableViewCell.swift
//  MA-github-client
//
//  Created by Igor Medelyan on 12/16/18.
//  Copyright © 2018 IMedelyan. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    private lazy var repositoryView: RepositoryInfoView = {
        return RepositoryInfoView.create()
    }()
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func fill(with model: Repository) {
        repositoryView.fill(with: model)
        contentView.addSubview(repositoryView)
    }
    
}
