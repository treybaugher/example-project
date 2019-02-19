//
//  UIButton+Style.swift
//  example-project
//
//  Created by Trey Baugher on 2/10/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import UIKit

extension UIButton {
    func setPrimaryEnabledStyle() {
        backgroundColor = .blue
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        layer.cornerRadius = 5
        layer.masksToBounds = true
        isEnabled = true
    }

    func setPrimaryDisabledStyle() {
        backgroundColor = .gray
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        layer.cornerRadius = 5
        layer.masksToBounds = true
        isEnabled = false
    }

    func setSecondaryStyle() {
        backgroundColor = .clear
        setTitleColor(.blue, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
}
