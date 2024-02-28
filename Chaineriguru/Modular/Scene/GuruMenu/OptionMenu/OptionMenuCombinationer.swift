//
//  OptionMenuCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit

class OptionMenuCombinationer {
    private let collector: OptionMenuCollector = OptionMenuCollector()
    
    func completeOptionMenuComponents(_ optionApp: UIImageView, _ optionClose: UIButton, _ profileOption: UIImageView, _ templatesOption: UIImageView, _ settingsOption: UIImageView, _ logoutOption: UIImageView, _ optionView: UIView, _ selectableImageViews: [UIImageView]) {
        optionApp.image = collector.appOptionsVisual
        optionClose.setImage(collector.closeOptionMenuVisual, for: .normal)
        profileOption.image = collector.optionProfileVisual
        templatesOption.image = collector.optionTemplatesVisual
        settingsOption.image = collector.optionSettingsVisual
        logoutOption.image = collector.optionLogoutVisual
        optionView.layer.cornerRadius = 10
        for selectableImageView in selectableImageViews {
            selectableImageView.image = collector.chaineriArrowVisual
        }
    }
    
    func predisplayLogoutOutView(_ logoutView: UIView, _ logoutPresentView: UIView, _ logoutTitle: UILabel, _ logoutQuestion: UILabel, _ closeLogout: UIButton, _ startLogout: UIButton) {
        logoutView.isHidden = false
        logoutPresentView.layer.cornerRadius = 10
        logoutTitle.text = collector.logoutOptionCaption
        logoutQuestion.text = collector.logoutQuestionCaption
        closeLogout.setTitle(collector.closeLogoutCaption, for: .normal)
        closeLogout.layer.cornerRadius = 10
        startLogout.setTitle(collector.startLogoutCaption, for: .normal)
        startLogout.layer.cornerRadius = 10
    }
    
    func finalizeLogoutUserState(_ completion: @escaping () -> ()) {
        UserDefaults.standard.setValue(false, forKey: "stateOfUserLogin")
        completion()
    }
    
    func setTextDataFromOptionMenuCollector(_ optionName: UILabel, _ optionProfile: UILabel, _ optionTemplates: UILabel, _ optionSettings: UILabel, _ optionLogout: UILabel) {
        optionName.text = collector.optionNameCaption
        optionProfile.text = collector.profileOptionCaption
        optionTemplates.text = collector.templatesOptionCaption
        optionSettings.text = collector.settingsOptionCaption
        optionLogout.text = collector.logoutOptionCaption
    }
}
