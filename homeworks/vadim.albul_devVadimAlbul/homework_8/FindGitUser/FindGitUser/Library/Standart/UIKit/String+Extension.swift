//
//  String+Extension.swift
//  FindGitUser
//
//  Created by Vadim Albul on 1/22/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import Foundation

extension String {
    
    var toHTMLAttributedString: NSAttributedString? {
        if let data = self.data(using: .utf8),
            let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            return attributedString
        }
        return nil
    }
}
