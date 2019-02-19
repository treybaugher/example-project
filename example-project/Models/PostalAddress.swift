//
//  PostalAddress.swift
//  example-project
//
//  Created by Trey Baugher on 2/10/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import Foundation

struct PostalAddress {
    private let id: String
    private let line1: String
    private let line2: String
    private let city: String
    private let state: String //not an enum to make this example simple
    private let zipCode: String

    init(id: String,
         line1: String,
         line2: String,
         city: String,
         state: String,
         zipCode: String) {
        self.id = id
        self.line1 = line1
        self.line2 = line2
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }

    func fullAdress() -> String {
        let secondLine = line2.isEmpty ? "" : "\(line2)\n"
        return "\(line1)\n\(secondLine)\(city), \(state) \(zipCode)"
    }
}
