//
//  LaunchRouteCenter.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 15.02.2024.
//

import UIKit

class LaunchRouteCenter {
    func openRouteToLoginViewComponent(_ viewComponent: LaunchViewComponent) {
        if let loginViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.userLogin, .loginViewComponent, modularTransitionStyle: .crossDissolve) as? LoginViewComponent {
            viewComponent.present(loginViewComponent, animated: true)
        }
    }
    
    func openRouteToUniqueProjectAfterLaunchViewComponent(_ viewComponent: LaunchViewComponent) {
        if let uniqueProjectViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.mainProjects, .uniqueProjectViewComponent, modularTransitionStyle: .crossDissolve) as? UniqueProjectViewComponent {
            viewComponent.present(uniqueProjectViewComponent, animated: true)
        }
    }
}
