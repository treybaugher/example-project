//
//  AddressFormContract.swift
//  example-project
//
//  Created by Trey Baugher on 2/12/19.
//  Copyright © 2019 Trey Baugher. All rights reserved.
//

import Foundation

protocol AddressFormDisplaying {
    func adjustZipCode(to text: String)
    func disableSubmitButton()
    func enableSubmitButton()
    func showLoadingSpinner()
    func hideLoadingSpinner()
    func showValidationError()
    func hideValidationError()
    func showServiceError()
    func hideServiceError()
    func dismissKeyboard()
}

protocol AddressFormCoordinating {
    func submitTapped()
    func line1FieldTextChanged(to text: String)
    func line2FieldTextChanged(to text: String)
    func cityFieldTextChanged(to text: String)
    func stateFieldTextChanged(to text: String)
    func zipCodeFieldTextChanged(to text: String)
}

protocol AddressFormRouting {
    func goToSaveSuccess()
}

protocol AddressFormStateInteracting {
    func line1InputChanged(to text: String)
    func line2InputChanged(to text: String)
    func cityInputChanged(to text: String)
    func stateInputChanged(to text: String)
    func zipCodeInputChanged(to text: String)
    func isStateValid() -> Bool
}
