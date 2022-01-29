//
//  LoginViewModel.swift
//  IDEHospital
//
//  Created by Ziad on 28/12/2020.
//

import Foundation

protocol LoginViewModelProtocol {
    func goToHome(user: User?)
}

class LoginViewModel {
    //MARK:- Properties
    private weak var view: AuthProtocol?
    
    //MARK:- Init
    init(view: AuthProtocol) {
        self.view = view
    }
}

//MARK:- LoginViewModel Protocol
extension LoginViewModel: LoginViewModelProtocol {
    func goToHome(user: User?) {
        if validateUser(with: user) {
            register(with: user!)
        }
    }
}

//MARK:- Private Methods
extension LoginViewModel {
    private func register(with user: User) {
        self.view?.showLoader()
        APIManager.login(with: user) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
                
            case .success(let response):
                if response.code == 201 && response.success == true {
                    UserDefaultsManager.shared().token = response.data?.access_token
                    self.view?.goToHomeScreen()
                } else {
                    if let message = response.message {
                        self.view?.showAlert(.failure(message), okButtonAction: .dismissCurrent)
                    }
                }
            case .failure(let error):
                print(error)
            }
            self.view?.hideLoader()
        }
    }
    
    private func validateUser(with user: User?) -> Bool {
        if let emailError = ValidationManager.shared().isValidData(with: .email(user?.email)) {
            self.view?.showAlert(.failure(emailError), okButtonAction: .dismissCurrent)
            return false
        }
        
        if let passwordError = ValidationManager.shared().isValidData(with: .password(user?.password)) {
            self.view?.showAlert(.failure(passwordError), okButtonAction: .dismissCurrent)
            return false
        }
        return true
    }
}
