//
//  AppDelegate.swift
//  IDEHospital
//
//  Created by Ziad on 07/12/2020.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        return true
    }
}

extension AppDelegate {
    static func sharedInstance() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
}
