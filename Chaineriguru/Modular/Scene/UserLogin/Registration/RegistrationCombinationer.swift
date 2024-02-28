//
//  RegistrationCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 18.02.2024.
//

import UIKit

class RegistrationCombinationer {
    private let collector: RegistrationCollector = RegistrationCollector()
    private let registrationDefaults = UserDefaults.standard
    
    func setTextDataFromRegistrationCollector(_ regApp: UILabel, _ regTitle: UILabel, _ regName: UILabel, _ regTwoName: UILabel, _ regEmail: UILabel, _ regPassOne: UILabel, _ regBusinessType: UILabel, _ regRemember: UILabel, _ regState: UIButton, _ isAcc: UILabel, _ toLog: UIButton) {
        regApp.text = collector.regAppNameCaption
        regTitle.text = collector.regCaption
        regName.text = collector.regNameCaption
        regTwoName.text = collector.regLastNameCaption
        regEmail.text = collector.regEmailCaption
        regPassOne.text = collector.regPassOneCaption
        regBusinessType.text = collector.regBusinessTypeCaption
        regRemember.text = collector.regRememberCaption
        regState.setTitle(collector.setRegStateCaption, for: .normal)
        regState.layer.cornerRadius = 10
        isAcc.text = collector.haveRegAccCaption
        toLog.setTitle(collector.moveToLogCaption, for: .normal)
    }
    
    func setupRegistrationStateWithInputData(_ nameTxtFld: UITextField, _ secNameTxtFld: UITextField, _ emailTxtFld: UITextField, _ onePassTxtFld: UITextField, _ typeTextField: UITextField, _ viewComponent: RegistrationViewComponent, _ completion: @escaping () -> ()) {
        if nameTxtFld.text!.isEmpty || secNameTxtFld.text!.isEmpty || emailTxtFld.text!.isEmpty || onePassTxtFld.text!.isEmpty || typeTextField.text!.isEmpty {
            viewComponent.interactViewComponentAlertWithInputData(collector.regComponentAlertTitleCaption, componentAlertMessage: collector.regComponentAlertMessageCaption)
        } else {
            registrationDefaults.set(nameTxtFld.text, forKey: "regUserName")
            registrationDefaults.set(secNameTxtFld.text, forKey: "regSecUserName")
            registrationDefaults.set(emailTxtFld.text, forKey: "regUserEmail")
            registrationDefaults.set(onePassTxtFld.text, forKey: "regUserPass")
            registrationDefaults.set(typeTextField.text, forKey: "regUserTypeStartup")
            registrationDefaults.setValue(true, forKey: "stateOfUserLogin")
            completion()
        }
    }
    
    func completeRegistrationComponents(_ regImageView: UIImageView, _ regMainView: UIView, _ regViews: [UIView], _ isRemember: UIButton) {
        regImageView.image = collector.regAppLogoVisual
        regMainView.layer.cornerRadius = 10
        
        for regView in regViews {
            regView.layer.cornerRadius = 10
            regView.layer.borderWidth = 1
            regView.layer.borderColor = UIColor.black.cgColor
        }
        
        isRemember.setImage(collector.falseRememberVisual, for: .normal)
    }
    
    func checkRememberState(_ rememberButton: UIButton) {
        if rememberButton.currentImage == collector.falseRememberVisual {
            rememberButton.setImage(collector.trueRememberVisual, for: .normal)
        } else {
            rememberButton.setImage(collector.falseRememberVisual, for: .normal)
        }
    }
    
    func configureRegistrationTextField(nameTxtFld: UITextField, lastNameTxtFld: UITextField, emailTxtFld: UITextField, passTxtFld: UITextField, businessTxtFld: UITextField, _ viewComponent: RegistrationViewComponent) {
        nameTxtFld.delegate = viewComponent
        lastNameTxtFld.delegate = viewComponent
        emailTxtFld.delegate = viewComponent
        passTxtFld.delegate = viewComponent
        businessTxtFld.delegate = viewComponent
        
        nameTxtFld.attributedPlaceholder = NSAttributedString(
            string: collector.regNamePlaceholderCaption,
            attributes: [NSAttributedString.Key.foregroundColor: collector.regPlaceholderColorType]
        )
        lastNameTxtFld.attributedPlaceholder = NSAttributedString(
            string: collector.regLastNamePlaceholderCaption,
            attributes: [NSAttributedString.Key.foregroundColor: collector.regPlaceholderColorType]
        )
        emailTxtFld.attributedPlaceholder = NSAttributedString(
            string: collector.regEmailPlaceholderCaption,
            attributes: [NSAttributedString.Key.foregroundColor: collector.regPlaceholderColorType]
        )
        passTxtFld.attributedPlaceholder = NSAttributedString(
            string: collector.regPassPlaceholderCaption,
            attributes: [NSAttributedString.Key.foregroundColor: collector.regPlaceholderColorType]
        )
        businessTxtFld.attributedPlaceholder = NSAttributedString(
            string: collector.regTypeBusinessPlaceholderCaption,
            attributes: [NSAttributedString.Key.foregroundColor: collector.regPlaceholderColorType]
        )
    }
}
