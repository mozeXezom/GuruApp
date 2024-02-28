//
//  ViewComponentAlert.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit

extension UIViewController {
    func interactViewComponentAlertWithInputData(_ componentAlertTitle: String, componentAlertMessage: String, _ componentCompletion: (() -> Void)? = nil) {
        let viewComponentAlert = UIAlertController(title: componentAlertTitle, message: componentAlertMessage, preferredStyle: .alert)
        let accessableComponentAction = UIAlertAction(title: "Понятно!", style: .default) { _ in
            componentCompletion?()
        }
        viewComponentAlert.addAction(accessableComponentAction)
        present(viewComponentAlert, animated: true, completion: nil)
    }
}

