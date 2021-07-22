//
//  ServiceSearchVC.swift
//  IDEHospital
//
//  Created by Ziad on 12/8/20.
//  Copyright © 2020 IDEAcademy. All rights reserved.
//

import UIKit

protocol ServiceSearchVCProtocol {
    func showAlert(type: PopUpType)
    func showItems()
    func addSelectedItem(_ viewWithTag: Int, _ item: String)
    func clearTextField(tag: Int)
    func doneButtonEnabled(_ enabled: Bool, for tag: Int)
    func switchToSearchResults(with doctorsFilter: DoctorsFilter)
}

class ServiceSearchVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var mainView: ServiceSearchView!
    
    // MARK:- Properties
    private var viewModel: ServiceSearchViewModelProtocol!
    
    // MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.setup()
    }
    
    // MARK:- Public Methods
    class func create(with categoryID: Int) -> ServiceSearchVC {
        let serviceSearchVC: ServiceSearchVC = UIViewController.create(storyboardName: Storyboards.serviceSearch, identifier: ViewControllers.serviceSearchVC)
        serviceSearchVC.viewModel = ServiceSearchViewModel(view: serviceSearchVC)
        serviceSearchVC.viewModel.prepareCategories(with: categoryID)
        return serviceSearchVC
    }
    
    // MARK:- IBAction Methods
    @IBAction func findDoctorButtonPressed(_ sender: UIButton) {
        viewModel.findDoctorTapped(doctorName: mainView.doctorNameTextField.text)
    }
}

extension ServiceSearchVC {
    // MARK:- Private Methods
    private func setupNavigationController() {
        setupNavController(title: L10n.serviceSearch)
        setupNavigationItems(backAction: .dismissCurrent)
    }
    
    private func setupDelegates() {
        mainView.specialistsTextField.delegate = self
        mainView.cityTextField.delegate = self
        mainView.regionTextField.delegate = self
        mainView.companiesTextField.delegate = self
        mainView.pickerView.delegate = self
        mainView.pickerView.dataSource = self
    }
    
    // MARK:- Objc Methods
    @objc private func doneTapped(_ sender: UIBarButtonItem) {
        viewModel.itemSelected(tag: sender.tag, row: mainView.pickerView.selectedRow(inComponent: 0))
    }
}

// MARK:- PickerView Delegate
extension ServiceSearchVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.itemsCount()
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.getItem(at: row)
    }
}

// MARK:- TextField Delegate
extension ServiceSearchVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        viewModel.preparePickerItems(with: textField.tag)
        textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneTapped(_:)))
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

// MARK:- ServiceSearchVC Protocol
extension ServiceSearchVC: ServiceSearchVCProtocol {
    func showItems() {
        DispatchQueue.main.async {
            self.mainView.pickerView.reloadAllComponents()
        }
    }
    
    func showAlert(type: PopUpType) {
        DispatchQueue.main.async {
            self.showSimpleAlert(type: type)
        }
    }
    
    func addSelectedItem(_ viewWithTag: Int, _ item: String) {
        DispatchQueue.main.async {
            let textField = self.mainView.viewWithTag(viewWithTag) as! UITextField
            textField.text = item
        }
    }
    
    func clearTextField(tag: Int) {
        DispatchQueue.main.async {
            let textField = self.mainView.viewWithTag(tag) as! UITextField
            textField.text = ""
        }
    }
    
    func doneButtonEnabled(_ enabled: Bool, for tag: Int) {
        DispatchQueue.main.async {
            let textField = self.mainView.viewWithTag(tag) as! UITextField
            textField.keyboardToolbar.doneBarButton.isEnabled = enabled
        }
    }
    
    func switchToSearchResults(with doctorsFilter: DoctorsFilter) {
        let searchResultsVC = SearchResultsVC.create(with: doctorsFilter)
        self.navigationController?.pushViewController(searchResultsVC, animated: true)
    }
}


