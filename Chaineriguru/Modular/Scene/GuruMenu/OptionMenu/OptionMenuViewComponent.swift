//
//  OptionMenuViewComponent.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit

class OptionMenuViewComponent: UIViewController {
    
    @IBOutlet weak var optionAppImageView: UIImageView!
    @IBOutlet weak var optionAppTitleLabel: UILabel!
    @IBOutlet weak var closeOptionMenuButton: UIButton!
    
    @IBOutlet weak var optionMenuView: UIView!
    @IBOutlet weak var profileOptionImageView: UIImageView!
    @IBOutlet weak var profileOptionLabel: UILabel!
    
    @IBOutlet weak var startupTemplatesImageView: UIImageView!
    @IBOutlet weak var startupTemplatesLabel: UILabel!
    
    @IBOutlet weak var optionSettingsImageView: UIImageView!
    @IBOutlet weak var optionSettingsLabel: UILabel!
    
    @IBOutlet weak var logoutOptionsImageView: UIImageView!
    @IBOutlet weak var logoutOptionsLabel: UILabel!
    @IBOutlet var optionsSelectableImageViews: [UIImageView]!
    
    @IBOutlet weak var logoutOutView: UIView!
    @IBOutlet weak var logoutPresentView: UIView!
    @IBOutlet weak var logoutTitleLabel: UILabel!
    @IBOutlet weak var questionLogoutLabel: UILabel!
    @IBOutlet weak var closeLogoutViewButton: UIButton!
    @IBOutlet weak var startLogoutButton: UIButton!
    
    private let combinationer: OptionMenuCombinationer = OptionMenuCombinationer()
    private let routeCenter: OptionMenuRouteCenter = OptionMenuRouteCenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        extendOptionMenuViewComponentWithData()
    }
    
    private func extendOptionMenuViewComponentWithData() {
        combinationer.completeOptionMenuComponents(optionAppImageView, closeOptionMenuButton, profileOptionImageView, startupTemplatesImageView, optionSettingsImageView, logoutOptionsImageView, optionMenuView, optionsSelectableImageViews)
        combinationer.setTextDataFromOptionMenuCollector(optionAppTitleLabel, profileOptionLabel, startupTemplatesLabel, optionSettingsLabel, logoutOptionsLabel)
    }
    
    @IBAction func closeOptionMenuWithTap(_ sender: UIButton) {
        routeCenter.openCloseOptionRouteToUniqueProjectViewComponent(self)
    }
    
    @IBAction func profileOptionWithTap(_ sender: UIButton) {
        routeCenter.openRouteToProfileGuruViewComponent(self)
    }
    
    @IBAction func templatesOptionWithTap(_ sender: UIButton) {
        routeCenter.openRouteToGuruTemplatesViewComponent(self)
    }
    
    @IBAction func settingsOptionWithTap(_ sender: UIButton) {
        routeCenter.openRouteToGuruSettingsViewComponent(self)
    }
    
    @IBAction func logoutOptionWithTap(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.2, options: .transitionCrossDissolve, animations: { [self] in
            combinationer.predisplayLogoutOutView(logoutOutView, logoutPresentView, logoutTitleLabel, questionLogoutLabel, closeLogoutViewButton, startLogoutButton)
        }, completion: nil)
    }
    
    @IBAction func closeLogoutViewWithTap(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.2, options: .transitionCrossDissolve, animations: { [self] in
            logoutOutView.isHidden = true
        }, completion: nil)
    }
    
    @IBAction func startLogoutWithTap(_ sender: UIButton) {
        combinationer.finalizeLogoutUserState {
            self.routeCenter.openLogoutRouteToLoginViewComponent(self)
        }
    }
}
