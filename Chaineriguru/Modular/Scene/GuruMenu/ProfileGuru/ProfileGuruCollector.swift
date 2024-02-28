//
//  ProfileGuruCollector.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 20.02.2024.
//

import UIKit

class ProfileGuruCollector {
    var profileGuruPlaceColor: UIColor {
        return #colorLiteral(red: 0.4019310474, green: 0.4376534522, blue: 0.5232694745, alpha: 1)
    }
    
    var profileGuruTitleCaption: String {
        return "Сhaineriguru"
    }
    
    var customProfileCaption: String {
        return "Профиль"
    }
    
    var personalInfoCaption: String {
        return "Личная информация"
    }
    
    var profileNameCaption: String {
        return "Имя"
    }
    
    var profileLastNameCaption: String {
        return "Фамилия"
    }
    
    var profileEmailCaption: String {
        return "Электронная почта"
    }
    
    var profilePassCaption: String {
        return "Пароль"
    }
    
    var closeProfileCaption: String {
        return "Закрыть"
    }
    
    var saveProfileCaption: String {
        return "Сохранить"
    }
    
    var saveAlertComponentTitleCaption: String {
        return "Ошибка!"
    }
    
    var saveAlertComponentMessageCaption: String {
        return "Прежде чем сохранить данные, вам нужно заполнить все поля!"
    }
    
    var correctComponentSaveTitleCaption: String {
        return "Готово!"
    }
    
    var correctComponentSaveMessageCaption: String {
        return "Ваши новые данные были успешно сохранены!"
    }
    
    var permissionViewComponentTitleCaption: String {
        return "Вы не разрешили доступ к вашей библиотеке фотографий!"
    }
    
    var permissionViewComponentMessageCaption: String {
        return "Чтобы выбрать изображение профиля, разрешите доступ к вашей библиотеке фотографий в настройках."
    }
}

extension ProfileGuruCollector {
    var guruProfileVisual: UIImage {
        return UIImage(named: "chaineriLogoImage")!
    }
    
    var noProfileVisual: UIImage {
        return UIImage(named: "addGuruVisual")!
    }
    
    var profileGuruMenuVisual: UIImage {
        return UIImage(named: "chaineriGuruMenu")!
    }
}
