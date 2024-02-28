//
//  OptionMenuCollector.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import Foundation
import UIKit

class OptionMenuCollector {
    var optionNameCaption: String {
        return "Сhaineriguru"
    }
    
    var profileOptionCaption: String {
        return "Профиль"
    }
    
    var templatesOptionCaption: String {
        return "Шаблоны для стартапов"
    }
    
    var settingsOptionCaption: String {
        return "Настройки"
    }
    
    var logoutOptionCaption: String {
        return "Выйти из аккаунта"
    }
    
    var logoutQuestionCaption: String {
        return "Вы уверены, что хотите выйти из аккаунта?"
    }
    
    var closeLogoutCaption: String {
        return "Закрыть"
    }
    
    var startLogoutCaption: String {
        return "Выйти из системы"
    }
}

extension OptionMenuCollector {
    var chaineriArrowVisual: UIImage {
        return UIImage(named: "arrowChaineri")!
    }
    
    var optionProfileVisual: UIImage {
        return UIImage(named: "chaineriProfile")!
    }
    
    var optionTemplatesVisual: UIImage {
        return UIImage(named: "chaineriTemplates")!
    }
    
    var optionSettingsVisual: UIImage {
        return UIImage(named: "chaineriSettings")!
    }
    
    var optionLogoutVisual: UIImage {
        return UIImage(named: "chaineriLogout")!
    }
    
    var closeOptionMenuVisual: UIImage {
        return UIImage(named: "optionMenuClose")!
    }
    
    var appOptionsVisual: UIImage {
        return UIImage(named: "chaineriLogoImage")!
    }
}
