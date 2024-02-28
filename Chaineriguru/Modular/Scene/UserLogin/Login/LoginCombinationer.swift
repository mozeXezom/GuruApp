//
//  LoginCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 15.02.2024.
//

import Foundation
import UIKit

class LoginCombinationer {
    private let collector: LoginCollector = LoginCollector()
    private let loginDefaults = UserDefaults.standard
    
    func completeLoginComponents(_ loginImageView: UIImageView, _ loginView: UIView, _ emailView: UIView, _ passwordView: UIView, _ rememberButton: UIButton) {
        loginImageView.image = collector.appLogoVisual
        loginView.layer.cornerRadius = 10
        
        emailView.layer.cornerRadius = 10
        emailView.layer.borderColor = UIColor.black.cgColor
        emailView.layer.borderWidth = 1
        
        passwordView.layer.cornerRadius = 10
        passwordView.layer.borderColor = UIColor.black.cgColor
        passwordView.layer.borderWidth = 1
        
        rememberButton.setImage(collector.offRememberVisual, for: .normal)
    }
    
    func prepareUserLoginDataState(_ logEmailTxtFld: UITextField, _ logPassTxtFld: UITextField, _ observeLabel: UILabel, _ viewComponent: LoginViewComponent, _ completion: @escaping () -> ()) {
        if logEmailTxtFld.text!.isEmpty || logPassTxtFld.text!.isEmpty {
            viewComponent.interactViewComponentAlertWithInputData(collector.loginComponentAlertTitleCaption, componentAlertMessage: collector.loginComponentAlertMessageCaption)
        } else {
            if logEmailTxtFld.text == loginDefaults.string(forKey: "regUserEmail") || logPassTxtFld.text == loginDefaults.string(forKey: "regUserPass") {
                loginDefaults.setValue(true, forKey: "stateOfUserLogin")
                completion()
            } else if logEmailTxtFld.text == "chaineriguru.test@mail.com" || logPassTxtFld.text == "ChaineriXKD143" {
                loginDefaults.setValue(true, forKey: "stateOfUserLogin")
                completion()
            } else {
                observeLabel.isHidden = false
            }
        }
    }
    
    func initWrongPassLoginState(_ wrongPassLabel: UILabel) {
        wrongPassLabel.text = collector.wrongPassCaption
        wrongPassLabel.isHidden = true
    }
    
    func precompleteLoginTextField(loginNameTxtFld: UITextField, loginPassTxtFld: UITextField, _ viewComponent: LoginViewComponent) {
        loginNameTxtFld.delegate = viewComponent
        loginPassTxtFld.delegate = viewComponent
        loginPassTxtFld.isSecureTextEntry = true
        
        loginNameTxtFld.attributedPlaceholder = NSAttributedString(
            string: collector.loginFieldsPlaceholderCaption,
            attributes: [NSAttributedString.Key.foregroundColor: collector.loginPlaceholderColorType]
        )
        loginPassTxtFld.attributedPlaceholder = NSAttributedString(
            string: collector.loginFieldsPlaceholderCaption,
            attributes: [NSAttributedString.Key.foregroundColor: collector.loginPlaceholderColorType]
        )
    }
    
    func setTextDataFromLoginCollector(_ appName: UILabel, _ presentLogin: UILabel, _ emailLogin: UILabel, _ passwordLogin: UILabel, _ rememberLogin: UILabel, _ initLoginButton: UIButton, _ noLogin: UILabel, _ moveToReg: UIButton) {
        appName.text = collector.appNameCaption
        presentLogin.text = collector.loginCaption
        emailLogin.text = collector.emailCaption
        passwordLogin.text = collector.passCaption
        rememberLogin.text = collector.rememberMeCaption
        initLoginButton.setTitle(collector.setLoginCaption, for: .normal)
        initLoginButton.layer.cornerRadius = 10
        noLogin.text = collector.noAccountCaption
        moveToReg.setTitle(collector.createAccountCaption, for: .normal)
    }
    
    func observeRememberMeState(rememberMe: UIButton) {
        if rememberMe.currentImage == collector.onRememberVisual {
            rememberMe.setImage(collector.offRememberVisual, for: .normal)
        } else {
            rememberMe.setImage(collector.onRememberVisual, for: .normal)
        }
    }
}
