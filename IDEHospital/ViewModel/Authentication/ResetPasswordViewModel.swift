//
//  ResetPasswordViewModel.swift
//  IDEHospital
//
//  Created by Ziad on 28/12/2020.
//

import Foundation

protocol ResetPasswordViewModelProtocol {
    func goToHome(user: User?)
}

class ResetPasswordViewModel {
    //MARK:- Properties
    private weak var view: AuthProtocol?
    
    //MARK:- Init
    init(view: AuthProtocol) {
        self.view = view
    }
}

//MARK:- ResetPasswordViewModel Protocol
extension ResetPasswordViewModel: ResetPasswordViewModelProtocol {
    func goToHome(user: User?) {
        if validateEmail(with: user) {
            resetPassword(with: user!)
        }
    }
    
}

//MARK:- Private Methods
extension ResetPasswordViewModel {
    private func resetPassword(with user: User) {
        self.view?.showLoader()
        APIManager.forgetPassword(with: user) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
                
            case .success(let response):
                if response.code == 202 && response.success == true {
                    self.view?.showAlert(.success(L10n.resetPasswordMsg), okButtonAction: .switchToHome)
                } else {
                    if let emailError = response.errors?.email?[0] {
                        self.view?.showAlert(.failure(emailError), okButtonAction: .dismissCurrent)
                    }
                }
            case .failure(let error):
                print(error)
            }
            self.view?.hideLoader()
        }
    }
    
    private func validateEmail(with user: User?) -> Bool {
        if let emailError = ValidationManager.shared().isValidData(with: .email(user?.email)) {
            self.view?.showAlert(.failure(emailError), okButtonAction: .dismissCurrent)
            return false
        }
        return true
    }
}
