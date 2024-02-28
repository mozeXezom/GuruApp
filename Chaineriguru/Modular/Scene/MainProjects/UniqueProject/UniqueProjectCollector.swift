//
//  UniqueProjectCollector.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit

class UniqueProjectCollector {
    var uniqueViewComponentTitleCaption: String {
        return "Нет доступа к вашей библиотеке фотографий!"
    }
    
    var uniqueViewComponentMessageCaption: String {
        return "Чтобы выбрать изображение для вашего стартапа, вам нужно разрешить доступ к вашей библиотеке фотографий в настройках."
    }
    
    var uniqueSettingsCaption: String {
        return "Открыть настройки"
    }
    
    var closeUniqueCaption: String {
        return "Отмена"
    }
    
    var uniqueProjectCaption: String {
        return "Сhaineriguru"
    }
    
    var addUniqueGoalCaption: String {
        return "Добавить цель"
    }
    
    var uniqueSelectionCaption: String {
        return "Добавить изображение"
    }
    
    var selectUniqueCaption: String {
        return "Загрузить изображение"
    }
    
    var uniqueGoalTitleCaption: String {
        return "Новая цель"
    }
    
    var uniqueGoalNameCaption: String {
        return "Название цели"
    }
    
    var additionalGoalsCaption: String {
        return "Добавьте вторичные цели"
    }
    
    var emptyUniqueNameCaption: String {
        return "Имя"
    }
    
    var noSumUniqueCaption: String {
        return "Цена $"
    }
    
    var uniqueGoalCloseCaption: String {
        return "Закрыть"
    }
    
    var uniqueGoalSetCaption: String {
        return "Добавить"
    }
    
    var newGoalUniquePlaceholderCaption: String {
        return "Например: серверная комната"
    }
    
    var reminderTrueTitleCaption: String {
        return "Упс, неполадка!"
    }
    
    var reminderTrueMessageCaption: String {
        return "Чтобы создать новую цель, вам нужно заполнить все поля!"
    }
    
    var yourGoalCaption: String {
        return "Ваша цель"
    }
    
    var additionalYourGoalsCaption: String {
        return "Ваши вторичные цели"
    }
    
    var noCreatedGoalsCaption: String {
        return "Список ваших целей пуст"
    }
    
    var deleteUniqueProjectTitleCaption: String {
        return "Вы действительно хотите удалить выбранную цель стартапа?"
    }
    
    var deleteUniqueProjectMessageCaption: String {
        return "Это действие необратимо!"
    }
    
    var trueDeleteCaption: String {
        return "Удалить"
    }
    
    var falseDeleteCaption: String {
        return "Оставить"
    }
}

extension UniqueProjectCollector {
    var uniqueVisual: UIImage {
        return UIImage(named: "chaineriLogoImage")!
    }
    
    var noUniqueVisual: UIImage {
        return UIImage(named: "addGuruVisual")!
    }
    
    var uniqueMenuVisual: UIImage {
        return UIImage(named: "chaineriGuruMenu")!
    }
    
    var deleteUniqueGoalVisual: UIImage {
        return UIImage(named: "deleteUniqueGoal")!
    }
    
    var uniqueGoalCustomColor: UIColor {
        return #colorLiteral(red: 0.3454300761, green: 0.4656803012, blue: 0.5904626846, alpha: 1)
    }
}
