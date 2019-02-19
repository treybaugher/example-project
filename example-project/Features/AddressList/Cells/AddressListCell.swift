//
//  AddressListCell.swift
//  example-project
//
//  Created by Trey Baugher on 2/10/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import UIKit

final class AddressListCell: UITableViewCell {

    @IBOutlet private weak var addressLabel: UILabel! {
        didSet {
            addressLabel.setBodyStyle()
        }
    }
    @IBOutlet private weak var editButton: UIButton! {
        didSet {
            editButton.setTitle("Edit", for: .normal) //normally localized
            editButton.setSecondaryStyle()
        }
    }

    private weak var delegate: AddressListCellDelegate! //crash in dev if configure is not called
    private var address: PostalAddress! //crash in dev if configure is not called

    class func reuseId() -> String {
        return "address-cell"
    }

    class func nib() -> UINib {
        return UINib(nibName: "AddressListCell", bundle: Bundle.main)
    }

    func configure(with address: PostalAddress, delegate: AddressListCellDelegate) {
        self.delegate = delegate
        self.address = address
        addressLabel.text = address.fullAdress()
    }

    @IBAction func editTap() {
        delegate.edit(address)
    }
}
