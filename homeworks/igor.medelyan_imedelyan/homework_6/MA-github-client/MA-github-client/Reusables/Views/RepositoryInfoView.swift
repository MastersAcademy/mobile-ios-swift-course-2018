//
//  RepositoryInfoView.swift
//  MA-github-client
//
//  Created by Igor Medelyan on 12/16/18.
//  Copyright © 2018 IMedelyan. All rights reserved.
//

import UIKit

class RepositoryInfoView: UIView {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subtitileLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    
    class func make() -> RepositoryInfoView {
        let nib = UINib(nibName: "RepositoryInfoView", bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil).first as! RepositoryInfoView
    }
    
    func fill(with model: Repository) {
        let nameFont = UIFont.defaultFont(for: .title1)
        let name = NSAttributedString(string: model.name,
                                      attributes: [.font: nameFont, .foregroundColor: UIColor.blue])
        nameLabel.attributedText = name
        
        let subtitleFont = UIFont.defaultFont(for: .subheadline)
        let subtitle = NSAttributedString(string: model.subtitle,
                                           attributes: [.font: subtitleFont, .foregroundColor: UIColor.gray])
        subtitileLabel.attributedText = subtitle
        
        let descriptionFont = UIFont.defaultFont(for: .body)
        let description = NSAttributedString(string: model.description,
                                             attributes: [.font: descriptionFont, .foregroundColor: UIColor.gray])
        descriptionLabel.attributedText = description
        
        let languageFont = UIFont.defaultFont(for: .body)
        let language = NSAttributedString(string: model.language,
                                             attributes: [.font: languageFont, .foregroundColor: UIColor.gray])
        languageLabel.attributedText = language
    }
}
