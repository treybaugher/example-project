//
//  AddressListRouter.swift
//  example-project
//
//  Created by Trey Baugher on 2/12/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import UIKit

final class AddressListRouter: AddressListRouting {
    private weak var view: UIViewController!

    class func makeScreen() -> UIViewController {
        let board = UIStoryboard(name: "AddressList", bundle: nil)
        let view = board.instantiateInitialViewController() as! AddressListViewController

        let router = AddressListRouter()
        router.view = view

        let coordinator = AddressListCoordinator(router: router, view: view)

        view.coordinator = coordinator

        let nav = UINavigationController(rootViewController: view)
        nav.navigationBar.setDefaultStyle()
        return nav
    }

    func goToAddAddress() {

    }

    func goToEditAddress(_ address: PostalAddress) {

    }
}
