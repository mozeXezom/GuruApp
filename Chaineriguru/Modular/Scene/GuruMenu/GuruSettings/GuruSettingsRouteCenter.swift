//
//  GuruSettingsRouteCenter.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit

class GuruSettingsRouteCenter {
    func openReturnRouteToOptionMenuViewComponent(_ viewComponent: GuruSettingsViewComponent) {
        if let returnOptionMenuViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.guruMenu, .optionMenuViewComponent, modularTransitionStyle: .crossDissolve) as? OptionMenuViewComponent {
            viewComponent.present(returnOptionMenuViewComponent, animated: true)
        }
    }
    
    func openExitRouteToLoginViewComponent(_ viewComponent: GuruSettingsViewComponent) {
        if let exitLoginViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.userLogin, .loginViewComponent, modularTransitionStyle: .crossDissolve) as? LoginViewComponent {
            viewComponent.present(exitLoginViewComponent, animated: true)
        }
    }
}
