//
//  UILabel+Style.swift
//  example-project
//
//  Created by Trey Baugher on 2/10/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import UIKit

extension UILabel {
    func setBodyStyle() {
        font = UIFont.preferredFont(forTextStyle: .body)
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        textAlignment = .left
        textColor = UIColor.darkGray
    }

    func setFieldTitleStyle() {
        font = UIFont.preferredFont(forTextStyle: .headline)
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        textAlignment = .left
        textColor = UIColor.darkGray
    }
}
