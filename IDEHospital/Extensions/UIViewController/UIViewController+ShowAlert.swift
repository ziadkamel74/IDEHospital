//
//  UIViewController+ShowAlert.swift
//  IDEHospital
//
//  Created by Ziad on 19/12/2020.
//

import UIKit

extension UIViewController {
    func openAlert(title: String,
                   message: String,
                   alertStyle:UIAlertController.Style,
                   actionTitles:[String],
                   actionStyles:[UIAlertAction.Style],
                   actions: [((UIAlertAction) -> Void)?]?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions?[index])
            alertController.addAction(action)
        }
        
        self.present(alertController, animated: true)
    }
}
