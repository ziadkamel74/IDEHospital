//
//  SearchResults.swift
//  IDEHospital
//
//  Created by Ziad on 12/19/20.
//

import UIKit

protocol SearchResultsVCProtocol: AnyObject {
    func showLoader()
    func hideLoader()
    func showAlert(type: PopUpType)
    func showSortType(_ sortType: String)
    func reloadData()
    func reloadToTop()
    func showNoDoctrosFoundLabel()
    func goToDoctorProfile(with doctorID: Int)
}

class SearchResultsVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var mainView: SearchResultsView!
    
    // MARK:- Properties
    private var viewModel: SearchResultsViewModelProtocol!
    
    // MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        mainView.setup()
        setupDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.searchForDoctors()
    }

    //MARK:- Public Methods
    class func create(with doctorsFilter: DoctorsFilter) -> SearchResultsVC {
        let searchResultsVC: SearchResultsVC = UIViewController.create(storyboardName: Storyboards.searchResults, identifier: ViewControllers.searchResultsVC)
        searchResultsVC.viewModel = SearchResultsViewModel(view: searchResultsVC, doctorsFilter: doctorsFilter)
        return searchResultsVC
    }
}


extension SearchResultsVC {
    // MARK:- Private Methods
    private func setupNavigationController() {
        title = L10n.searchResults
        setupNavigationItems(backAction: .popUpCurrent)
    }
    
    private func setupDelegates() {
        mainView.sortTextField.delegate = self
        mainView.picker.delegate = self
        mainView.picker.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(UINib(nibName: Cells.searchResultsCell, bundle: nil), forCellReuseIdentifier: Cells.searchResultsCell)
    }
    
    // MARK:- Objc Methods
    @objc private func cancelTapped() {
        mainView.sortTextField.resignFirstResponder()
    }
    
    @objc private func doneTapped() {
        viewModel.sortTypeSelected(row: mainView.picker.selectedRow(inComponent: 0))
        mainView.sortTextField.resignFirstResponder()
    }
}

// MARK:- TextField Delegate
extension SearchResultsVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.addCancelDoneOnKeyboardWithTarget(self, cancelAction: #selector(cancelTapped), doneAction: #selector(doneTapped))
        return true
    }
}

// MARK:- PickerView Delegate
extension SearchResultsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.getSortTypes().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.getSortTypes()[row]
    }
}

// MARK:- TableView Delegate
extension SearchResultsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getItemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainView.tableView.dequeueReusableCell(withIdentifier: Cells.searchResultsCell, for: indexPath) as! SearchResultsCell
        cell.delegate = self
        cell.configure(with: viewModel.getItem(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.willDisplay(indexPath.row)
    }
}

// MARK:- SearchResultsVC Protocol
extension SearchResultsVC: SearchResultsVCProtocol {
    func showLoader() {
        view.showActivityIndicator()
    }
    
    func hideLoader() {
        view.hideActivityIndicator()
    }
    
    func showAlert(type: PopUpType) {
        showSimpleAlert(type: type)
    }
    
    func showSortType(_ sortType: String) {
        DispatchQueue.main.async {
            self.mainView.sortTextField.text = sortType
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.mainView.tableView.reloadData()
        }
    }
    
    func reloadToTop() {
        let topIndex = IndexPath(row: 0, section: 0)
        DispatchQueue.main.async {
            self.mainView.tableView.reloadData()
            self.mainView.tableView.scrollToRow(at: topIndex, at: .top, animated: true)
        }
    }
    
    func showNoDoctrosFoundLabel() {
        DispatchQueue.main.async {
            self.mainView.showNoDoctorsFoundLabel()
        }
    }
    
    func goToDoctorProfile(with doctorID: Int) {
        let doctorProfileVC = DoctorProfileVC.create(with: doctorID)
        self.navigationController?.pushViewController(doctorProfileVC, animated: true)
    }
}

//MARK:- Delegate Methods
extension SearchResultsVC: CellButtonDelegate {
    func bookNow(customTableViewCell: UITableViewCell) {
        guard let indexPath = mainView.tableView.indexPath(for: customTableViewCell) else {return}
        viewModel.bookNow(with: indexPath.row)
    }
    
    func addFavorite(customTableViewCell: UITableViewCell) {
        guard let indexPath = mainView.tableView.indexPath(for: customTableViewCell) else {return}
        viewModel.addRemoveFavorite(with: indexPath.row)
    }
}
