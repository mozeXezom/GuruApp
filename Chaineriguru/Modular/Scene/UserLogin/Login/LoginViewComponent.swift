//
//  LoginViewComponent.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 14.02.2024.
//

import UIKit

class LoginViewComponent: UIViewController {
    
    @IBOutlet weak var loginAppImageView: UIImageView!
    @IBOutlet weak var loginAppNameLabel: UILabel!
    @IBOutlet weak var loginMainView: UIView!
    
    @IBOutlet weak var presentLoginLabel: UILabel!
    @IBOutlet weak var emailLoginLabel: UILabel!
    @IBOutlet weak var emailLoginView: UIView!
    @IBOutlet weak var emailLoginTextField: UITextField!
    
    @IBOutlet weak var passwordLoginLabel: UILabel!
    @IBOutlet weak var passwordLoginView: UIView!
    @IBOutlet weak var passwordLoginTextField: UITextField!
    @IBOutlet weak var wrongLoginPasswordLabel: UILabel!
    
    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var rememberMeLoginLabel: UILabel!
    
    @IBOutlet weak var initiateLoginButton: UIButton!
    @IBOutlet weak var noLoginAccountLabel: UILabel!
    @IBOutlet weak var moveToRegAccountButton: UIButton!
    
    private let combinationer: LoginCombinationer = LoginCombinationer()
    private let routeCenter: LoginRouteCenter = LoginRouteCenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        extendLoginViewComponentWithData()
    }
    
    @IBAction func rememberMeWithTap(_ sender: UIButton) {
        combinationer.observeRememberMeState(rememberMe: sender)
    }
    
    @IBAction func initiateLoginWithTap(_ sender: UIButton) {
        combinationer.prepareUserLoginDataState(emailLoginTextField, passwordLoginTextField, wrongLoginPasswordLabel, self) {
            self.routeCenter.openRouteToUniqueProjectAfterLoginViewComponent(self)
        }
    }
    
    @IBAction func moveToRegAccountWithTap(_ sender: UIButton) {
        routeCenter.openRouteToRegistrationViewComponent(self)
    }
    
    private func extendLoginViewComponentWithData() {
        combinationer.completeLoginComponents(loginAppImageView, loginMainView, emailLoginView, passwordLoginView, rememberMeButton)
        combinationer.initWrongPassLoginState(wrongLoginPasswordLabel)
        
        combinationer.precompleteLoginTextField(loginNameTxtFld: emailLoginTextField, loginPassTxtFld: passwordLoginTextField, self)
        combinationer.setTextDataFromLoginCollector(loginAppNameLabel, presentLoginLabel, emailLoginLabel, passwordLoginLabel, rememberMeLoginLabel, initiateLoginButton, noLoginAccountLabel, moveToRegAccountButton)
    }
}

extension LoginViewComponent: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
