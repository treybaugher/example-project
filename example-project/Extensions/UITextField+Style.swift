//
//  UITextField+Style.swift
//  example-project
//
//  Created by Trey Baugher on 2/18/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import UIKit

extension UITextField {
    func setDefaultStyle() {
        font = UIFont.preferredFont(forTextStyle: .body)
        textColor = UIColor.darkGray
    }
}
