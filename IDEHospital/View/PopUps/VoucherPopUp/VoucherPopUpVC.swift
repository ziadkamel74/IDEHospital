//
//  VoucherPopUpVC.swift
//  IDEHospital
//
//  Created by Ziad on 1/5/21.
//

import UIKit

protocol DoctorProfilePopupsDelegate: AnyObject {
    func continueTapped(appointment: Appointment, doctorName: String)
    func confirmTapped()
    func authenticatedAndBooked()
}

extension DoctorProfilePopupsDelegate {
    func continueTapped(appointment: Appointment, doctorName: String) {}
    func authenticatedAndBooked() {}
}

protocol VoucherPopUpVCProtocol: AnyObject {
    func getVoucherCode() -> String?
    func getPatientName() -> String?
    func showAlert(type: PopUpType)
    func askForConfirmation(for appointment: Appointment, doctorName: String)
}

class VoucherPopUpVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var mainView: VoucherPopUpView!
    
    // MARK:- Properties
    private var viewModel: VoucherPopUpViewModelProtocol!
    weak var delegate: DoctorProfilePopupsDelegate?
    
    // MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setup()
        setSwitchTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseInOut, animations: {
            self.view.backgroundColor = ColorName.greyishBrown87.color.withAlphaComponent(0.87)
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view == view.subviews.first {
            view.endEditing(true)
        } else {
            dismissCurrent()
        }
    }
    
    // MARK:- Public Methods
    class func create(appointment: Appointment, doctorName: String) -> VoucherPopUpVC {
        let voucherPopUpVC: VoucherPopUpVC = UIViewController.create(storyboardName: Storyboards.voucherPopUp, identifier: ViewControllers.voucherPopUpVC)
        voucherPopUpVC.viewModel = VoucherPopUpViewModel(view: voucherPopUpVC, appointment: appointment, doctorName: doctorName)
        return voucherPopUpVC
    }
    
    // MARK:- Actions
    @IBAction func continueButtonPressed(_ sender: CustomButton) {
//        delegate?.voucherPopupAction(appointment: )
        viewModel.continueTapped(mainView.voucherSwitch.isOn, mainView.anotherPersonSwitch.isOn)
    }
}

extension VoucherPopUpVC {
    // MARK:- Private Methods
    private func setSwitchTarget() {
        mainView.voucherSwitch.addTarget(self, action: #selector(voucherSwitchValueChanged), for: .valueChanged)
        mainView.anotherPersonSwitch.addTarget(self, action: #selector(anotherPersonSwitchValueChanged), for: .valueChanged)
    }
    
    // MARK:- Objc Methods
    @objc private func voucherSwitchValueChanged() {
        mainView.voucherCodeTextField.isHidden = !mainView.voucherCodeTextField.isHidden
        mainView.voucherCodeTextField.resignFirstResponder()
    }
    
    @objc private func anotherPersonSwitchValueChanged() {
        mainView.anotherPersonNameTextField.isHidden = !mainView.anotherPersonNameTextField.isHidden
        mainView.anotherPersonNameTextField.resignFirstResponder()
    }
}

// MARK:- VoucherPopUpVC Protocol
extension VoucherPopUpVC: VoucherPopUpVCProtocol {
    func getVoucherCode() -> String? {
        return mainView.voucherCodeTextField.text
    }
    
    func getPatientName() -> String? {
        return mainView.anotherPersonNameTextField.text
    }
    
    func showAlert(type: PopUpType) {
        showSimpleAlert(type: type)
    }
    
    func askForConfirmation(for appointment: Appointment, doctorName: String) {
        dismissCurrent()
        delegate?.continueTapped(appointment: appointment, doctorName: doctorName)
    }
}

