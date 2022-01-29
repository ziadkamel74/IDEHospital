//
//  HomeNurseVC.swift
//  IDEHospital
//
//  Created by Ziad on 12/16/20.
//

import UIKit

protocol HomeNurseContactUsVCProtocol: AnyObject {
    func addPlaceholder(_ text: String)
    func showAlert(type: PopUpType, okButtonAction: OkButtonAction)
    func showLoader()
    func hideLoader()
    func popUp()
    func dismiss()
}

enum RequestType {
    case homeNurse
    case contactUs
}

class HomeNurseContactUsVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var mainView: HomeNurseContactUsView!
    
    // MARK:- Properties
    private var viewModel: HomeNurseContactUsViewModelProtocol!
    
    // MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        mainView.setup(buttonTitle: viewModel.getTitles().1, isNumberLabelHidden: viewModel.isNumberLabelHidden(), textViewPlaceHolder: viewModel.getPlaceHolder())
        mainView.detailsTextView.delegate = self
    }

    //MARK:- Public Methods
    class func create(status: RequestType) -> HomeNurseContactUsVC {
        let homeNurseContactUsVC: HomeNurseContactUsVC = UIViewController.create(storyboardName: Storyboards.homeNurse, identifier: ViewControllers.homeNurseContactUsVC)
        homeNurseContactUsVC.viewModel = HomeNurseContactUsViewModel(view: homeNurseContactUsVC, status: status)
        return homeNurseContactUsVC
    }
    
    // MARK:- Actions
    @IBAction func sendRequestButtonPressed(_ sender: UIButton) {
        viewModel.requestTapped(with: RequestData(name: mainView.nameTextField.text, email: mainView.emailTextField.text, mobile: mainView.phoneTextField.text, message: mainView.detailsTextView.text))
    }
}

// MARK:- Private Methods
extension HomeNurseContactUsVC {
    private func setupNavigationController() {
        setupNavController(title: viewModel.getTitles().0)
    }
}

// MARK:- TextView Delegate
extension HomeNurseContactUsVC: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        DispatchQueue.main.async {
            textView.text = ""
        }
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        viewModel.textViewShouldEndEditing(text: textView.text)
        return true
    }
}

// MARK:- HomeNurseVC Protocol
extension HomeNurseContactUsVC: HomeNurseContactUsVCProtocol {
    func addPlaceholder(_ text: String) {
        DispatchQueue.main.async {
            self.mainView.detailsTextView.text = text
        }
    }
    
    func showAlert(type: PopUpType, okButtonAction: OkButtonAction) {
        showSimpleAlert(type: type, okButtonAction: okButtonAction, delegate: self)
    }
    
    func showLoader() {
        view.showActivityIndicator()
    }
    
    func hideLoader() {
        view.hideActivityIndicator()
    }
    
    func popUp() {
        popUpCurrent()
    }
    
    func dismiss() {
        dismissCurrent()
    }
}

// MARK:- Popup Button Delegate
extension HomeNurseContactUsVC: SuccessOrFailurePopUpOkButtonDelegate {
    func okTapped() {
        viewModel.okTapped()
    }
}
