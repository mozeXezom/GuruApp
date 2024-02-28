//
//  GuruSettingsViewComponent.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit

class GuruSettingsViewComponent: UIViewController {
    
    @IBOutlet weak var guruSettingsImageView: UIImageView!
    @IBOutlet weak var guruTitleLabel: UILabel!
    @IBOutlet weak var returnOptionMenuButton: UIButton!
    
    @IBOutlet weak var guruSettingsView: UIView!
    @IBOutlet weak var optionSettingsLabel: UILabel!
    @IBOutlet weak var mainSettingsLabel: UILabel!
    
    @IBOutlet weak var currencyGuruImageView: UIImageView!
    @IBOutlet weak var currencyGuruLabel: UILabel!
    @IBOutlet weak var guruCurrencyTypeLabel: UILabel!
    
    @IBOutlet weak var languageGuruImageView: UIImageView!
    @IBOutlet weak var languageGuruLabel: UILabel!
    @IBOutlet weak var guruLanguageTypeLabel: UILabel!
    
    @IBOutlet weak var notificationsGuruImageView: UIImageView!
    @IBOutlet weak var notificationsGuruLabel: UILabel!
    @IBOutlet var guruTypeViews: [UIView]!
    
    @IBOutlet weak var exportGuruImageView: UIImageView!
    @IBOutlet weak var exportGuruLabel: UILabel!
    
    @IBOutlet weak var personalOptionsLabel: UILabel!
    @IBOutlet weak var reminderGuruImageView: UIImageView!
    @IBOutlet weak var reminderGuruLabel: UILabel!
    
    @IBOutlet weak var dailyAutoAdviceImageView: UIImageView!
    @IBOutlet weak var dailyAutoAdviceLabel: UILabel!
    
    @IBOutlet weak var reportDailyImageView: UIImageView!
    @IBOutlet weak var reportDailyLabel: UILabel!
    
    @IBOutlet weak var closeGuruSettingsButton: UIButton!
    @IBOutlet weak var saveGuruSettingsButton: UIButton!
    
    @IBOutlet weak var guruNotificationsSwitcher: UIButton!
    @IBOutlet weak var guruReminderSwitcher: UIButton!
    @IBOutlet weak var guruAdviceSwitcher: UIButton!
    @IBOutlet weak var guruReportSwitcher: UIButton!
    
    @IBOutlet weak var removableAccountView: UIView!
    @IBOutlet weak var deleteGuruProfileButton: UIButton!
    @IBOutlet weak var guruDeletePreviewView: UIView!
    @IBOutlet weak var questionDeletionView: UIView!
    @IBOutlet weak var guruDeletionTitleLabel: UILabel!
    @IBOutlet weak var askForDeletionLabel: UILabel!
    @IBOutlet weak var closeDeletionGuruButton: UIButton!
    @IBOutlet weak var completeDeletionGuruButton: UIButton!
    @IBOutlet weak var deletionReminderLabel: UILabel!
    
    private let routeCenter: GuruSettingsRouteCenter = GuruSettingsRouteCenter()
    private let combinationer: GuruSettingsCombinationer = GuruSettingsCombinationer()

    override func viewDidLoad() {
        super.viewDidLoad()
        extendGuruSettingsViewComponentWithData()
    }
    
    private func extendGuruSettingsViewComponentWithData() {
        combinationer.setTextDataFromGuruSettingsCollector(guruTitleLabel, optionSettingsLabel, mainSettingsLabel, currencyGuruLabel, guruCurrencyTypeLabel, languageGuruLabel, guruLanguageTypeLabel, notificationsGuruLabel, exportGuruLabel, personalOptionsLabel, reminderGuruLabel, dailyAutoAdviceLabel, reportDailyLabel, closeGuruSettingsButton, saveGuruSettingsButton)
        combinationer.loadGuruSwitchStates(self)
        combinationer.preinteractTypeViews(guruTypeViews, guruSettingsView)
        combinationer.preappearGuruDeleteProfileView(removableAccountView, deleteGuruProfileButton, deletionReminderLabel)
        combinationer.completeGuruSettingsComponents(guruSettingsImageView, returnOptionMenuButton, currencyGuruImageView, languageGuruImageView, notificationsGuruImageView, exportGuruImageView, reminderGuruImageView, dailyAutoAdviceImageView, reportDailyImageView)
    }
    
    @IBAction func returnOptionMenuWithTap(_ sender: UIButton) {
        routeCenter.openReturnRouteToOptionMenuViewComponent(self)
    }
    
    @IBAction func exportGuruWithTap(_ sender: UIButton) {
        
    }
    
    @IBAction func closeGuruSettingsWithTap(_ sender: UIButton) {
        routeCenter.openReturnRouteToOptionMenuViewComponent(self)
    }
    
    @IBAction func saveGuruSettingsWithTap(_ sender: UIButton) {
        combinationer.preinteractSaveState(self)
    }
    
    @IBAction func guruNotificationsSwitcherWithTap(_ sender: UIButton) {
        combinationer.pretoggleGuruSwitcher(sender)
    }
    
    @IBAction func guruRemindersSwitcherWithTap(_ sender: UIButton) {
        combinationer.pretoggleGuruSwitcher(sender)
    }
    
    @IBAction func guruAdviceSwitcherWithTap(_ sender: UIButton) {
        combinationer.pretoggleGuruSwitcher(sender)
    }
    
    @IBAction func guruReportSwitcherWithTap(_ sender: UIButton) {
        combinationer.pretoggleGuruSwitcher(sender)
    }
    
    @IBAction func deleteGuruProfileWithTap(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.4, options: .transitionCrossDissolve, animations: { [self] in
            combinationer.inDisplayGuruProfileDeletionView(guruDeletePreviewView, questionDeletionView, guruDeletionTitleLabel, askForDeletionLabel, closeDeletionGuruButton, completeDeletionGuruButton)
        }, completion: nil)
    }
    
    @IBAction func closeDeletionGuruWithTap(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.4, options: .transitionCrossDissolve, animations: { [self] in
            guruDeletePreviewView.isHidden = true
        }, completion: nil)
    }
    
    @IBAction func completeDeletionGuruWithTap(_ sender: UIButton) {
        combinationer.makeGuruDeletionProfileInitiation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.routeCenter.openExitRouteToLoginViewComponent(self)
            }
        }
    }
}
