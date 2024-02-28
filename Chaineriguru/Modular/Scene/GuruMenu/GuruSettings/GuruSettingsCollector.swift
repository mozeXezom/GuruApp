//
//  GuruSettingsCollector.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit

class GuruSettingsCollector {
    var guruSettingsAppCaption: String {
        return "Сhaineriguru"
    }
    
    var settingsGuruCaption: String {
        return "Настройки"
    }
    
    var mainSettingsCaption: String {
        return "Главное"
    }
    
    var guruCurrencyCaption: String {
        return "Валюта"
    }
    
    var typeCurrencyCaption: String {
        return "USD"
    }
    
    var guruLanguageCaption: String {
        return "Язык"
    }
    
    var typeLanguageCaption: String {
        return "РУС"
    }
    
    var guruNotificationsCaption: String {
        return "Уведомления"
    }
    
    var guruExportCaption: String {
        return "Экспорт"
    }
    
    var personalSettingsCaption: String {
        return "Личное"
    }
    
    var guruRemindersCaption: String {
        return "Напоминание"
    }
    
    var guruDailyAdviceCaption: String {
        return "Ежедневный совет"
    }
    
    var reportDailyCaption: String {
        return "Ежедневный отчет"
    }
    
    var closeGuruSettingsCaption: String {
        return "Закрыть"
    }
    
    var saveGuruSettingsCaption: String {
        return "Сохранить"
    }
    
    var guruSettingsTitleAlertCaption: String {
        return "Успешно!"
    }
    
    var guruSettingsMessageAlertCaption: String {
        return "Ваши настройки сохранены!"
    }
    
    var deleteGuruProfileCaption: String {
        return "Удаление аккаунта"
    }
    
    var deletionGuruQuestionCaption: String {
        return "Вы действительно хотите удалить свой аккаунт? Учтите, все ваши данные будут удалены НАВСЕГДА!"
    }
    
    var completeDeletionCaption: String {
        return "Удалить аккаунт"
    }
    
    var notDeletetionCaption: String {
        return "Отменить"
    }
    
    var reminderForDeletionCaption: String {
        return "Обратите внимание, в случае удаления вашего аккаунта, все ваши данные будут удалены навсегда!"
    }
}

extension GuruSettingsCollector {
    var guruCurrencyTypeVisual: UIImage {
        return UIImage(named: "guruCurrencyType")!
    }
    
    var guruLanguageTypeVisual: UIImage {
        return UIImage(named: "guruLanguageType")!
    }
    
    var guruNotificationsVisual: UIImage {
        return UIImage(named: "guruNotifications")!
    }
    
    var guruExportVisual: UIImage {
        return UIImage(named: "guruExport")!
    }
    
    var guruRemindersVisual: UIImage {
        return UIImage(named: "guruReminders")!
    }
    
    var guruDailyAdviceVisual: UIImage {
        return UIImage(named: "guruDailyAdvice")!
    }
    
    var guruReportDailyVisual: UIImage {
        return UIImage(named: "guruReportDaily")!
    }
    
    var switcherGuruOnVisual: UIImage {
        return UIImage(named: "switcherGuruOn")!
    }
    
    var switcherGuruOffVisual: UIImage {
        return UIImage(named: "switcherGuruOff")!
    }
    
    var optionsGuruAppVisual: UIImage {
        return UIImage(named: "chaineriLogoImage")!
    }
    
    var chaineriGuruMenuVisual: UIImage {
        return UIImage(named: "chaineriGuruMenu")!
    }
    
    var guruDeleteProfileVisual: UIImage {
        return UIImage(named: "deleteUniqueGoal")!
    }
}
