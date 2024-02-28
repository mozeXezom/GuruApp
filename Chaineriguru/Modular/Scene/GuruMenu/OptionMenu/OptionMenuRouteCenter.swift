//
//  OptionMenuRouteCenter.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit

class OptionMenuRouteCenter {
    func openRouteToGuruSettingsViewComponent(_ viewComponent: OptionMenuViewComponent) {
        if let guruSettingsViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.guruMenu, .guruSettingsViewComponent, modularTransitionStyle: .crossDissolve) as? GuruSettingsViewComponent {
            viewComponent.present(guruSettingsViewComponent, animated: true)
        }
    }
    
    func openRouteToProfileGuruViewComponent(_ viewComponent: OptionMenuViewComponent) {
        if let profileGuruViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.guruMenu, .profileGuruViewComponent, modularTransitionStyle: .crossDissolve) as? ProfileGuruViewComponent {
            viewComponent.present(profileGuruViewComponent, animated: true)
        }
    }
    
    func openRouteToGuruTemplatesViewComponent(_ viewComponent: OptionMenuViewComponent) {
        if let guruTemplatesViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.guruMenu, .guruTemplatesViewComponent, modularTransitionStyle: .crossDissolve) as? GuruTemplatesViewComponent {
            viewComponent.present(guruTemplatesViewComponent, animated: true)
        }
    }
    
    func openCloseOptionRouteToUniqueProjectViewComponent(_ viewComponent: OptionMenuViewComponent) {
        if let uniqueProjectViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.mainProjects, .uniqueProjectViewComponent, modularTransitionStyle: .crossDissolve) as? UniqueProjectViewComponent {
            viewComponent.present(uniqueProjectViewComponent, animated: true)
        }
    }
    
    func openLogoutRouteToLoginViewComponent(_ viewComponent: OptionMenuViewComponent) {
        if let logoutLoginViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.userLogin, .loginViewComponent, modularTransitionStyle: .crossDissolve) as? LoginViewComponent {
            viewComponent.present(logoutLoginViewComponent, animated: true)
        }
    }
}
