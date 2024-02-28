//
//  LoginCollector.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 15.02.2024.
//

import UIKit

class LoginCollector {
    var appNameCaption: String {
        return "Сhaineriguru"
    }
    
    var loginCaption: String {
        return "Вход"
    }
    
    var emailCaption: String {
        return "Адрес электронной почты"
    }
    
    var passCaption: String {
        return "Пароль"
    }
    
    var wrongPassCaption: String {
        return "Введите правильный пароль"
    }
    
    var rememberMeCaption: String {
        return "Запомнить меня"
    }
    
    var setLoginCaption: String {
        return "Войти"
    }
    
    var loginPlaceholderColorType: UIColor {
        return #colorLiteral(red: 0.4788996577, green: 0.5085040927, blue: 0.5801179409, alpha: 1)
    }
    
    var noAccountCaption: String {
        return "У вас нет аккаунта?"
    }
    
    var loginComponentAlertTitleCaption: String {
        return "Упс..."
    }
    
    var createAccountCaption: String {
        return "Регистрация тут"
    }
    
    var loginFieldsPlaceholderCaption: String {
        return "..."
    }
    
    var loginComponentAlertMessageCaption: String {
        return "Прежде чем продолжить, вам нужно указать логин и пароль!"
    }
}

extension LoginCollector {
    var appLogoVisual: UIImage {
        return UIImage(named: "chaineriLogoImage")!
    }
    
    var offRememberVisual: UIImage {
        return UIImage(named: "rememberBlackImage")!
    }
    
    var onRememberVisual: UIImage {
        return UIImage(named: "rememberBlueImage")!
    }
}
