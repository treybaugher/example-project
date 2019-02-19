//
//  AddressListViewController.swift
//  example-project
//
//  Created by Trey Baugher on 2/10/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import UIKit

final class AddressListViewController: UIViewController {

    var coordinator: AddressListCoordinating!
    //^ not private so router can set property during screen construction

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(AddressListCell.nib(),
                               forCellReuseIdentifier: AddressListCell.reuseId())
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 100
            tableView.tableFooterView = .init(frame: .zero)
            tableView.bounces = false
        }
    }

    @IBOutlet private weak var errorView: UIView!
    @IBOutlet private weak var loadErrorLabel: UILabel! {
        didSet {
            loadErrorLabel.setBodyStyle()
            loadErrorLabel.textAlignment = .center
            loadErrorLabel.text = "There was an issue loading your addreses." // normally localized
        }
    }

    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var loadingLabel: UILabel! {
        didSet {
            loadingLabel.setBodyStyle()
            loadingLabel.textAlignment = .center
            loadingLabel.text = "Loading your addreses, please wait..." // normally localized
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator.screenLoaded()
    }
}

extension AddressListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coordinator.rowAmount(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseId = AddressListCell.reuseId()
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId) as! AddressListCell

        let address = coordinator.addressForRow(indexPath.row)
        cell.configure(with: address, delegate: coordinator)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return coordinator.sectionAmount()
    }
}

extension AddressListViewController: AddressListDisplaying {
    func refreshList() {
        tableView.reloadData()
    }

    func showList() {
        tableView.isHidden = false
    }

    func hideList() {
        tableView.isHidden = true
    }

    func showLoadingSpinner() {
        loadingView.isHidden = false
    }

    func hideLoadingSpinner() {
        loadingView.isHidden = true
    }

    func showLoadingError() {
        errorView.isHidden = false
    }

    func hideLoadingError() {
        errorView.isHidden = true
    }
}
