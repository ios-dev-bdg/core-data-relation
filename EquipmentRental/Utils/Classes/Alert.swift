//
//  Alert.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    ///
    /// Input in UIAlertController
    ///
    /// - Parameter vc: viewController to source show alert
    /// - Parameter compeltionHandler: callback to pass data
    ///
    static func loanInput(vc: UIViewController, completionHandler: @escaping(_ name: String?, _ amount: Int64?)->Void){
        let alertController = UIAlertController(title: "Input", message: "", preferredStyle: .alert)
        
        // Input name
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Input name"
        }
        
        // Input item count
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Input item count"
            textField.keyboardType = .numberPad
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { alert  in
            let nameTextField = alertController.textFields![0]
            let itemCountTextField = alertController.textFields![1]
            completionHandler(nameTextField.text, Int64(itemCountTextField.text ?? ""))
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
    ///
    /// Show any error
    ///
    /// - Parameter vc: viewController to source show alert
    /// - Parameter message: text to show error
    ///
    static func showMessage(vc: UIViewController, title: String, message: String, completion: (()->Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        vc.present(alertController, animated: true, completion: completion)
    }
    ///
    /// Choice
    ///
    /// - Parameter vc: viewController to source show alert
    /// - Parameter message: text to show error
    ///
    static func showQuestion(vc: UIViewController, title: String, message: String, okAction: ((_ action: UIAlertAction)->Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: okAction))
        vc.present(alertController, animated: true, completion: nil)
    }
}
