//
//  AddressListStateInteractor.swift
//  example-project
//
//  Created by Trey Baugher on 2/12/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import Foundation

final class AddressListStateInteractor: AddressListStateInteracting {

    enum State {
        case loadNotStarted
        case reloadRequired([PostalAddress])
        case loading
        case loadFailed
        case loaded([PostalAddress])
    }

    private var state: State

    init(state: State = .loadNotStarted) {
        self.state = state
    }

    func loadStarted() {
        state = .loading
    }

    func loadFailed() {
        state = .loadFailed
    }

    func successfullyLoaded(_ addressList: [PostalAddress]) {
        state = .loaded(addressList)
    }

    func listNeedsReload() {
        state = .reloadRequired(addressList())
    }

    func addressList() -> [PostalAddress] {
        switch state {
        case .loaded(let list):
            return list
        case .reloadRequired(let list):
            return list
        default:
            return []
        }
    }

    func isLoadRequired() -> Bool {
        switch state {
        case .loading, .loaded, .loadFailed:
            return false
        default:
            return true
        }
    }

    func isLoading() -> Bool {
        switch state {
        case .loading:
            return true
        default:
            return false
        }
    }

    func isListLoaded() -> Bool {
        switch state {
        case .loaded, .reloadRequired:
            return true
        default:
            return false
        }
    }

    func didListLoadFail() -> Bool {
        switch state {
        case .loadFailed:
            return true
        default:
            return false
        }
    }
}
