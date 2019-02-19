//
//  AddressListServiceInteractor.swift
//  example-project
//
//  Created by Trey Baugher on 2/10/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import Foundation

protocol AddressListServiceObserving: class {
    func addressListServiceFailed()
    func addressListServiceSucceeded(_ list: [PostalAddress])
}

protocol AddressListServiceInteracting: class {
    var observer: AddressListServiceObserving? { get set }

    func getAddressList()
}

class AddressListServiceInteractor: AddressListServiceInteracting {
    weak var observer: AddressListServiceObserving?

    func getAddressList() {

        //actual service call removed for simplicity
        
        let list = [PostalAddress(id: "1",
                                  line1: "2012 Main St.",
                                  line2: "Apt B.",
                                  city: "Springfield",
                                  state: "CO",
                                  zipCode: "24315"),
                    PostalAddress(id: "2",
                                  line1: "5 Curving Lane",
                                  line2: "",
                                  city: "St. Louis",
                                  state: "MO",
                                  zipCode: "62314")]

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.observer?.addressListServiceSucceeded(list)
        }
    }

}
