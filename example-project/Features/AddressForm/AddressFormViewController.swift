//
//  AddressFormViewController.swift
//  example-project
//
//  Created by Trey Baugher on 2/12/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import UIKit

final class AddressFormViewController: UIViewController {
    var coordinator: AddressFormCoordinating!
    //^ not private so router can set property during screen construction

    @IBOutlet weak var errorHeader: UIView!

    @IBOutlet weak var errorHeaderLabel: UILabel! {
        didSet {
            line1Label.text = "Set this text before display"
            line1Label.accessibilityIdentifier = "error-text"
            line1Label.setBodyStyle()
        }
    }

    @IBOutlet weak var line1Label: UILabel! {
        didSet {
            line1Label.text = "Line 1"
            line1Label.setFieldTitleStyle()
        }
    }

    @IBOutlet weak var line2Label: UILabel! {
        didSet {
            line2Label.text = "Line 2"
            line2Label.setFieldTitleStyle()
        }
    }

    @IBOutlet weak var cityLabel: UILabel! {
        didSet {
            cityLabel.text = "City"
            cityLabel.setFieldTitleStyle()
        }
    }

    @IBOutlet weak var stateLabel: UILabel! {
        didSet {
            stateLabel.text = "State"
            stateLabel.setFieldTitleStyle()
        }
    }

    @IBOutlet weak var zipCodeLabel: UILabel! {
        didSet {
            zipCodeLabel.text = "Zip Code"
            zipCodeLabel.setFieldTitleStyle()
        }
    }

    @IBOutlet weak var line1Field: UITextField! {
        didSet {
            line1Field.placeholder = "Line 1"
            line1Field.setDefaultStyle()
            line1Field.textContentType = .streetAddressLine1
        }
    }

    @IBOutlet weak var line2Field: UITextField! {
        didSet {
            line2Field.placeholder = "Line 2 (optional)"
            line2Field.setDefaultStyle()
            line2Field.textContentType = .streetAddressLine2
        }
    }

    @IBOutlet weak var cityField: UITextField! {
        didSet {
            cityField.placeholder = "City"
            cityField.setDefaultStyle()
            cityField.textContentType = .addressCity
        }
    }

    @IBOutlet weak var stateField: UITextField! {
        didSet {
            stateField.placeholder = "State"
            stateField.setDefaultStyle()
            stateField.textContentType = .addressState
        }
    }

    @IBOutlet weak var zipCodeField: UITextField! {
        didSet {
            zipCodeField.placeholder = "Zip Code"
            zipCodeField.setDefaultStyle()
            zipCodeField.keyboardType = .numberPad
            zipCodeField.textContentType = .postalCode
        }
    }

    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.setTitle("Save",
                                for: .normal)
            saveButton.setPrimaryEnabledStyle()
        }
    }

    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.setTitle("Cancel",
                                  for: .normal)
            cancelButton.setSecondaryStyle()
        }
    }
    
}

extension AddressFormViewController: AddressFormDisplaying {
    func adjustZipCode(to text: String) {
        zipCodeField.text = text
    }

    func disableSubmitButton() {
        saveButton.setPrimaryDisabledStyle()
    }

    func enableSubmitButton() {
        saveButton.setPrimaryEnabledStyle()
    }

    func showLoadingSpinner() {

    }

    func hideLoadingSpinner() {

    }

    func showValidationError() {
        errorHeader.isHidden = false
        
    }

    func hideValidationError() {
        errorHeader.isHidden = true
    }

    func showServiceError() {
        errorHeader.isHidden = false

    }

    func hideServiceError() {
        errorHeader.isHidden = true
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
}
