//
//  GuruSettingsCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import Foundation
import UIKit

class GuruSettingsCombinationer {
    private let collector: GuruSettingsCollector = GuruSettingsCollector()
    private let switcherGuruTags = [1001, 1002, 1003, 1004]
    private let switcherGuruKeys = ["NotificationsSwitchState", "ReminderSwitchState", "AdviceSwitchState", "ReportSwitchState"]
    private let guruSettingsDefaults = UserDefaults.standard
    
    func setTextDataFromGuruSettingsCollector(_ guruTitle: UILabel, _ optionSettings: UILabel, _ mainSettings: UILabel, _ currencyGuru: UILabel, _ typeCurrency: UILabel, _ languageGuru: UILabel, _ typeLanguage: UILabel, _ guruNotif: UILabel, _ exportGuru: UILabel, _ personalOptions: UILabel, _ reminderGuru: UILabel, _ autoAdvice: UILabel, _ autoReport: UILabel, _ closeGuru: UIButton, _ saveGuru: UIButton) {
        guruTitle.text = collector.guruSettingsAppCaption
        optionSettings.text = collector.settingsGuruCaption
        mainSettings.text = collector.mainSettingsCaption
        currencyGuru.text = collector.guruCurrencyCaption
        typeCurrency.text = collector.typeCurrencyCaption
        languageGuru.text = collector.guruLanguageCaption
        typeLanguage.text = collector.typeLanguageCaption
        guruNotif.text = collector.guruNotificationsCaption
        exportGuru.text = collector.guruExportCaption
        personalOptions.text = collector.personalSettingsCaption
        reminderGuru.text = collector.guruRemindersCaption
        autoAdvice.text = collector.guruDailyAdviceCaption
        autoReport.text = collector.reportDailyCaption
        closeGuru.setTitle(collector.closeGuruSettingsCaption, for: .normal)
        closeGuru.layer.cornerRadius = 10
        saveGuru.setTitle(collector.saveGuruSettingsCaption, for: .normal)
        saveGuru.layer.cornerRadius = 10
    }
    
    func preinteractTypeViews(_ typeViews: [UIView], _ guruSettingsView: UIView) {
        for typeView in typeViews {
            typeView.layer.cornerRadius = 10
            typeView.layer.borderColor = #colorLiteral(red: 0.8495541215, green: 0.8671723008, blue: 0.8920050263, alpha: 1)
            typeView.layer.borderWidth = 1
        }
        guruSettingsView.layer.cornerRadius = 10
    }

    func observeGuruSwitcherAppearance(_ guruSwitcher: UIButton, _ isOn: Bool) {
        let customSwitcherVisual = isOn ? collector.switcherGuruOnVisual : collector.switcherGuruOffVisual
        guruSwitcher.setImage(customSwitcherVisual, for: .normal)
    }
    
    func preinteractSaveState(_ viewComponent: GuruSettingsViewComponent) {
        viewComponent.interactViewComponentAlertWithInputData(collector.guruSettingsTitleAlertCaption, componentAlertMessage: collector.guruSettingsMessageAlertCaption)
    }
    
    func makeGuruDeletionProfileInitiation(_ completion: @escaping () -> ()) {
        guruSettingsDefaults.removeObject(forKey: "regUserName")
        guruSettingsDefaults.removeObject(forKey: "regSecUserName")
        guruSettingsDefaults.removeObject(forKey: "regUserEmail")
        guruSettingsDefaults.removeObject(forKey: "regUserPass")
        guruSettingsDefaults.removeObject(forKey: "regUserTypeStartup")
        guruSettingsDefaults.set(false, forKey: "stateOfUserLogin")
        completion()
    }
    
    func preappearGuruDeleteProfileView(_ deleteView: UIView, _ guruDeleteButton: UIButton, _ deletionReminder: UILabel) {
        deleteView.layer.cornerRadius = 10
        guruDeleteButton.setImage(collector.guruDeleteProfileVisual, for: .normal)
        guruDeleteButton.setTitle(collector.deleteGuruProfileCaption, for: .normal)
        deletionReminder.text = collector.reminderForDeletionCaption
    }
    
    func pretoggleGuruSwitcher(_ sender: UIButton) {
        guard let switcherIndex = switcherGuruTags.firstIndex(of: sender.tag) else { return }
        let switchState = UserDefaults.standard.bool(forKey: switcherGuruKeys[switcherIndex])
        UserDefaults.standard.set(!switchState, forKey: switcherGuruKeys[switcherIndex])
        observeGuruSwitcherAppearance(sender, !switchState)
    }
    
    func inDisplayGuruProfileDeletionView(_ deletionView: UIView, _ questionView: UIView, _ deletionTitle: UILabel, _ deletionQuestion: UILabel, _ closeDeletion: UIButton, _ completeDeletion: UIButton) {
        deletionView.isHidden = false
        questionView.layer.cornerRadius = 10
        deletionTitle.text = collector.deleteGuruProfileCaption
        deletionQuestion.text = collector.deletionGuruQuestionCaption
        closeDeletion.setTitle(collector.notDeletetionCaption, for: .normal)
        completeDeletion.setTitle(collector.completeDeletionCaption, for: .normal)
        closeDeletion.layer.cornerRadius = 10
        completeDeletion.layer.cornerRadius = 10
    }
    
    func loadGuruSwitchStates(_ viewComponent: GuruSettingsViewComponent) {
        for (index, key) in switcherGuruKeys.enumerated() {
            let switchGuruState = UserDefaults.standard.bool(forKey: key)
            if let customSwitcher = viewComponent.view.viewWithTag(switcherGuruTags[index]) as? UIButton {
                observeGuruSwitcherAppearance(customSwitcher, switchGuruState)
            }
        }
    }
    
    func completeGuruSettingsComponents(_ guruSettings: UIImageView, _ returnOption: UIButton, _ guruCurrency: UIImageView, _ guruLanguage: UIImageView, _ guruNotifications: UIImageView, _ guruExport: UIImageView, _ guruReminder: UIImageView, _ guruAdvice: UIImageView, _ guruReport: UIImageView) {
        guruSettings.image = collector.optionsGuruAppVisual
        returnOption.setImage(collector.chaineriGuruMenuVisual, for: .normal)
        guruCurrency.image = collector.guruCurrencyTypeVisual
        guruLanguage.image = collector.guruLanguageTypeVisual
        guruNotifications.image = collector.guruNotificationsVisual
        guruExport.image = collector.guruExportVisual
        guruReminder.image = collector.guruRemindersVisual
        guruAdvice.image = collector.guruDailyAdviceVisual
        guruReport.image = collector.guruReportDailyVisual
    }
}
