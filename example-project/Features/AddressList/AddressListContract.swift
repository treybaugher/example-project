//
//  AddressListContract.swift
//  example-project
//
//  Created by Trey Baugher on 2/10/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import Foundation


//todo: Notification Center Observing
//todo: add add button to nav
//todo: add nav via delegate preso

protocol AddressListDisplaying: class {
    func refreshList()
    func showList()
    func hideList()
    func showLoadingSpinner()
    func hideLoadingSpinner()
    func showLoadingError()
    func hideLoadingError()
}

protocol AddressListCoordinating: AddressListCellDelegate, AddressListServiceObserving {
    func screenLoaded()
    func screenAppeared()
    func sectionAmount() -> Int
    func rowAmount(inSection: Int) -> Int
    func addressForRow(_ row: Int) -> PostalAddress
    func addAddress()
}

protocol AddressListRouting {
    func goToAddAddress()
    func goToEditAddress(_ address: PostalAddress)
}

protocol AddressListStateInteracting {
    func loadStarted()
    func loadFailed()
    func successfullyLoaded(_ addressList: [PostalAddress])
    func listNeedsReload()
    func addressList() -> [PostalAddress]
    func isLoadRequired() -> Bool
    func isLoading() -> Bool
    func isListLoaded() -> Bool
    func didListLoadFail() -> Bool
}

protocol AddressListCellDelegate: class {
    func edit(_ address: PostalAddress)
}
