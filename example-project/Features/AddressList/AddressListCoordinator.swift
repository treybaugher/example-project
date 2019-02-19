//
//  AddressListCoordinator.swift
//  example-project
//
//  Created by Trey Baugher on 2/10/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import Foundation

final class AddressListCoordinator: AddressListCoordinating {
    private weak var view: AddressListDisplaying!
    private let router: AddressListRouting
    private let addressListServiceInteractor: AddressListServiceInteracting
    private let listStateInteractor: AddressListStateInteracting

    init(router: AddressListRouting,
         view: AddressListDisplaying,
         addressListServiceInteractor: AddressListServiceInteracting = AddressListServiceInteractor(),
         listState: AddressListStateInteracting = AddressListStateInteractor()) {
        self.router = router
        self.view = view
        self.listStateInteractor = listState
        self.addressListServiceInteractor = addressListServiceInteractor
        self.addressListServiceInteractor.observer = self
    }

    func screenLoaded() {
        loadListIfNeeded()
    }

    func screenAppeared() {
        loadListIfNeeded()
    }

    func sectionAmount() -> Int {
        return 1
    }

    func rowAmount(inSection: Int) -> Int {
        return listStateInteractor.addressList().count
    }

    func addressForRow(_ row: Int) -> PostalAddress {
        return listStateInteractor.addressList()[row]
    }

    func addAddress() {
        router.goToAddAddress()
    }

    private func loadListIfNeeded() {
        if listStateInteractor.isLoadRequired() {
            addressListServiceInteractor.getAddressList()
            listStateInteractor.loadStarted()
            adjustViewForState()
        }
    }

    private func adjustViewForState() {
        view.refreshList()
        listStateInteractor.isListLoaded() ? view.showList() : view.hideList()
        listStateInteractor.didListLoadFail() ? view.showLoadingError() : view.hideLoadingError()
        listStateInteractor.isLoading() ? view.showLoadingSpinner() : view.hideLoadingSpinner()
    }
}

extension AddressListCoordinator: AddressListCellDelegate {
    func edit(_ address: PostalAddress) {
        router.goToEditAddress(address)
    }
}

extension AddressListCoordinator: AddressListServiceObserving {
    func addressListServiceFailed() {
        listStateInteractor.loadFailed()
        adjustViewForState()
    }

    func addressListServiceSucceeded(_ list: [PostalAddress]) {
        listStateInteractor.successfullyLoaded(list)
        adjustViewForState()
    }
}
