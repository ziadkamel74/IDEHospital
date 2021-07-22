//
//  ServiceSearchViewModel.swift
//  IDEHospital
//
//  Created by Ziad on 12/10/20.
//  Copyright © 2020 IDEAcademy. All rights reserved.
//

import Foundation

protocol ServiceSearchViewModelProtocol {
    func prepareCategories(with categoryID: Int)
    func itemsCount() -> Int
    func getItem(at row: Int) -> String
    func preparePickerItems(with tag: Int)
    func itemSelected(tag: Int, row: Int)
    func findDoctorTapped(doctorName: String?)
}

class ServiceSearchViewModel {
    
    // MARK:- Properties
    private var view: ServiceSearchVCProtocol?
    private var categoryData: CategoryData!
    private var items: [String] = []
    private var doctorsFilter: DoctorsFilter!
    
    // MARK:- Init
    init(view: ServiceSearchVCProtocol) {
        self.view = view
    }
}

// MARK:- Private Methods
extension ServiceSearchViewModel {
    private func getCategories(with categoriesID: Int) {
        APIManager.getCategoriesData(with: categoriesID) { [weak self] (response) in
            switch response {
            case .failure(let error):
                print(error)
                self?.view?.showAlert(type: .failure(L10n.responseError))
            case .success(let categoryResponse):
                self?.categoryData = categoryResponse.data
            }
        }
    }
}

// MARK:- ViewModel Protocol
extension ServiceSearchViewModel: ServiceSearchViewModelProtocol {
    func prepareCategories(with categoryID: Int) {
        self.doctorsFilter = DoctorsFilter(categoryId: categoryID, page: 1)
        getCategories(with: categoryID)
    }
    
    func itemsCount() -> Int {
        return items.count
    }
    
    func getItem(at row: Int) -> String {
        return items[row]
    }
    
    func preparePickerItems(with tag: Int) {
        guard categoryData != nil else { return }
        switch tag {
        case 1:
            items = categoryData.specialties.map{$0.name}
        case 2:
            items = categoryData.cities.map{$0.name}
        case 3:
            if let city = categoryData.cities.first(where: {$0.id == doctorsFilter.cityId}) {
                view?.doneButtonEnabled(true, for: tag)
                items = city.regions.map{$0.name}
            } else {
                items = [L10n.chooseCityFirst]
                view?.doneButtonEnabled(false, for: tag)
            }
        case 4:
            items = categoryData.companies.map{$0.name}
        default: break
        }
        view?.showItems()
    }
    
    func itemSelected(tag: Int, row: Int) {
        guard items.indices.contains(row) else { return }
        switch tag {
        case 1:
            let specialty = categoryData.specialties[row]
            view?.addSelectedItem(tag, specialty.name)
            doctorsFilter.specialtyId = specialty.id
        case 2:
            let city = categoryData.cities[row]
            view?.addSelectedItem(tag, city.name)
            if city.id == doctorsFilter.cityId {
                break
            }
            doctorsFilter?.cityId = city.id
            view?.clearTextField(tag: 3)
        case 3:
            if let city = categoryData.cities.first(where: {$0.id == doctorsFilter?.cityId}) {
                let region = city.regions[row]
                view?.addSelectedItem(tag, region.name)
                doctorsFilter.regionId = region.id
            }
            view?.addSelectedItem(tag, items[row])
        case 4:
            let company = categoryData.companies[row]
            view?.addSelectedItem(tag, company.name)
            doctorsFilter.companyId = company.id
        default: break
        }
    }
    
    func findDoctorTapped(doctorName: String?) {
        doctorsFilter.doctorName = doctorName
        if let doctorsFilter = doctorsFilter {
            view?.switchToSearchResults(with: doctorsFilter)
        }
    }
}
