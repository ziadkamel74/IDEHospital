//
//  YesOrNoPopUpViewModel.swift
//  IDEHospital
//
//  Created by Ziad on 1/5/21.
//

import Foundation

protocol YesOrNoPopUpViewModelProtocol {
    func getTitle() -> String
}

class YesOrNoPopUpViewModel {
    
    // MARK:- Properties
    private weak var view: YesOrNoPopUpVCDelegate?
    private let title: String
    
    // MARK:- Init
    init(view: YesOrNoPopUpVCDelegate, title: String) {
        self.view = view
        self.title = title
    }
}

// MARK:- ViewModel Protocol
extension YesOrNoPopUpViewModel: YesOrNoPopUpViewModelProtocol {
    func getTitle() -> String {
        return title
    }
}
