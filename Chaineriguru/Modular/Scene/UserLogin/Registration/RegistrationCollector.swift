//
//  RegistrationCollector.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 18.02.2024.
//

import UIKit

class RegistrationCollector {
    var regAppNameCaption: String {
        return "Сhaineriguru"
    }
    
    var regCaption: String {
        return "Регистрация"
    }
    
    var regNameCaption: String {
        return "Имя"
    }
    
    var regLastNameCaption: String {
        return "Фамилия"
    }
    
    var regEmailCaption: String {
        return "Адрес электронной почты"
    }
    
    var regPassOneCaption: String {
        return "Создать пароль"
    }
    
    var regBusinessTypeCaption: String {
        return "Название вашего стартапа"
    }
    
    var regRememberCaption: String {
        return "Запомнить"
    }
    
    var setRegStateCaption: String {
        return "Зарегистрироваться"
    }
    
    var haveRegAccCaption: String {
        return "У вас есть аккаунт?"
    }
    
    var moveToLogCaption: String {
        return "Войдите здесь"
    }
    
    var regComponentAlertTitleCaption: String {
        return "Ой!"
    }
    
    var regNamePlaceholderCaption: String {
        return "Александр"
    }
    
    var regLastNamePlaceholderCaption: String {
        return "Иванов"
    }
    
    var regEmailPlaceholderCaption: String {
        return "email@mail.com"
    }
    
    var regPassPlaceholderCaption: String {
        return "123456789"
    }
    
    var regTypeBusinessPlaceholderCaption: String {
        return "Например: Технологический скачок"
    }
    
    var regComponentAlertMessageCaption: String {
        return "Прежде чем продолжить, вам нужно заполнить все поля выше!"
    }
    
    var regPlaceholderColorType: UIColor {
        return #colorLiteral(red: 0.4788996577, green: 0.5085040927, blue: 0.5801179409, alpha: 1)
    }
}

extension RegistrationCollector {
    var falseRememberVisual: UIImage {
        return UIImage(named: "rememberBlackImage")!
    }
    
    var trueRememberVisual: UIImage {
        return UIImage(named: "rememberBlueImage")!
    }
    
    var regAppLogoVisual: UIImage {
        return UIImage(named: "chaineriLogoImage")!
    }
}
