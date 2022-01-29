//
//  ServiceSearchView.swift
//  IDEHospital
//
//  Created by Ziad on 12/8/20.
//

import UIKit

class ServiceSearchView: UIView {

    // MARK:- Outlets
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var specialistsTextField: PaddedTextField!
    @IBOutlet weak var cityTextField: PaddedTextField!
    @IBOutlet weak var regionTextField: PaddedTextField!
    @IBOutlet weak var companiesTextField: PaddedTextField!
    @IBOutlet weak var doctorNameTextField: PaddedTextField!
    @IBOutlet weak var findDoctorButton: CustomButton!
    
    // MARK:- Properties
    let pickerView = UIPickerView()
    
    // MARK:- Public Methods
    func setup() {
        setupBackground()
        setupLabels()
        setupTextFields()
        setupButton()
    }
}

// MARK:- Private Methods
extension ServiceSearchView {
    private func setupLabels() {
        setupLabel(firstTitleLabel, with: L10n.firstTitle, font: FontFamily.PTSans.bold,fontSize: 40)
        setupLabel(secondTitleLabel, with: L10n.secondTitle, font: FontFamily.PTSans.regular, fontSize: 20)
    }
    
    private func setupLabel(_ label: UILabel, with text: String, font: FontConvertible,fontSize: CGFloat) {
        label.text = text
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(font: font, size: fontSize)
    }
    
    private func setupTextFields() {
        setupTextField(specialistsTextField, tag: 1, placeholder: L10n.specialist, leftIcon: Asset.medicalHeart.image)
        setupTextFieldPicker(specialistsTextField)
        setupTextField(cityTextField, tag: 2, placeholder: L10n.city, leftIcon: Asset.pin.image)
        setupTextFieldPicker(cityTextField)
        setupTextField(regionTextField, tag: 3, placeholder: L10n.region, leftIcon: Asset.pin.image)
        setupTextFieldPicker(regionTextField)
        setupTextField(companiesTextField, tag: 4, placeholder: L10n.company, leftIcon: Asset.life.image)
        setupTextFieldPicker(companiesTextField)
        setupTextField(doctorNameTextField, tag: 5, placeholder: L10n.doctorName, leftIcon: Asset.doctor.image)
    }
    
    private func setupTextField(_ textField: PaddedTextField, tag: Int, placeholder: String, leftIcon: UIImage) {
        textField.backgroundColor = .white
        textField.alpha = 0.8
        textField.tag = tag
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:[NSAttributedString.Key.foregroundColor: ColorName.blackTwo.color, NSAttributedString.Key.font: UIFont(font: FontFamily.PTSans.regular, size: 20)!])
        textField.setTextFieldIcons(with: leftIcon)
        textField.setupCornerRadiuss()
    }
    
    private func setupTextFieldPicker(_ textField: UITextField) {
        textField.inputView = pickerView
    }
    
    private func setupButton() {
        findDoctorButton.setTitle(L10n.findDoctor, for: .normal)
        findDoctorButton.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
    }
}
