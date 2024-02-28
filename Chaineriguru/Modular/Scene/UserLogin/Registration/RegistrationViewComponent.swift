//
//  ViewController.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 14.02.2024.
//

import UIKit

class RegistrationViewComponent: UIViewController {
    
    @IBOutlet weak var regAppImageView: UIImageView!
    @IBOutlet weak var regAppNameLabel: UILabel!
    
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var regTitleLabel: UILabel!
    
    @IBOutlet weak var regNameLabel: UILabel!
    @IBOutlet weak var regNameTextField: UITextField!
    
    @IBOutlet weak var lastNameRegLabel: UILabel!
    @IBOutlet weak var lastNameRegTextField: UITextField!
    
    @IBOutlet weak var regEmailLabel: UILabel!
    @IBOutlet weak var regEmailTextField: UITextField!
    
    @IBOutlet weak var passRegLabel: UILabel!
    @IBOutlet weak var passRegTextField: UITextField!
    
    @IBOutlet weak var regBusinessTypeLabel: UILabel!
    @IBOutlet weak var regBusinessTypeTextField: UITextField!
    @IBOutlet var regViews: [UIView]!
    
    @IBOutlet weak var rememberRegButton: UIButton!
    @IBOutlet weak var rememberRegLabel: UILabel!
    
    @IBOutlet weak var finishRegStateButton: UIButton!
    @IBOutlet weak var alreadyRegLabel: UILabel!
    @IBOutlet weak var forwardToLoginButton: UIButton!
    
    private let routeCenter: RegistrationRouteCenter = RegistrationRouteCenter()
    private let combinationer: RegistrationCombinationer = RegistrationCombinationer()

    override func viewDidLoad() {
        super.viewDidLoad()
        extendRegistrationViewComponentWithData()
    }
    
    private func extendRegistrationViewComponentWithData() {
        combinationer.setTextDataFromRegistrationCollector(regAppNameLabel, regTitleLabel, regNameLabel, lastNameRegLabel, regEmailLabel, passRegLabel, regBusinessTypeLabel, rememberRegLabel, finishRegStateButton, alreadyRegLabel, forwardToLoginButton)
        
        combinationer.configureRegistrationTextField(nameTxtFld: regNameTextField, lastNameTxtFld: lastNameRegTextField, emailTxtFld: regEmailTextField, passTxtFld: passRegTextField, businessTxtFld: regBusinessTypeTextField, self)
        
        combinationer.completeRegistrationComponents(regAppImageView, registrationView, regViews, rememberRegButton)
    }
    
    @IBAction func rememberRegWithTap(_ sender: UIButton) {
        combinationer.checkRememberState(sender)
    }
    
    @IBAction func finishRegStateWithTap(_ sender: UIButton) {
        combinationer.setupRegistrationStateWithInputData(regNameTextField, lastNameRegTextField, regEmailTextField, passRegTextField, regBusinessTypeTextField, self) {
            self.routeCenter.openRouteToUniqueProjectAfterRegistrationViewComponent(self)
        }
    }
    
    @IBAction func forwardToLoginWithTap(_ sender: UIButton) {
        routeCenter.openBackRouteToLoginViewComponent(self)
    }
}

extension RegistrationViewComponent: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
