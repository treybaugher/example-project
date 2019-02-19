//
//  CreateAddressServiceInteractor.swift
//  example-project
//
//  Created by Trey Baugher on 2/18/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import Foundation

struct CreateAddressRequest: Encodable {
    let line1: String
    let line2: String?
    let city: String
    let state: String
    let zipCode: String
}

protocol CreateAddressServiceObserving: class {
    func createAddressServiceFailed()
    func createAddressServiceSucceeded()
}

protocol CreateAddressServiceInteracting: class {
    var observer: CreateAddressServiceObserving? { get set }

    func addAddress(request: CreateAddressRequest)
}

class CreateAddressServiceInteractor: CreateAddressServiceInteracting {
    weak var observer: CreateAddressServiceObserving?

    func addAddress(request: CreateAddressRequest) {

        //actual service call removed for simplicity

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if request.city == "fail" {
                self?.observer?.createAddressServiceFailed()
            } else {
                self?.observer?.createAddressServiceSucceeded()
            }
        }
    }

}
