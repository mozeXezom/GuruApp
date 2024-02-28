//
//  LoginRouteCenter.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 15.02.2024.
//

import UIKit

class LoginRouteCenter {
    func openRouteToRegistrationViewComponent(_ viewComponent: LoginViewComponent) {
        if let registrationViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.userLogin, .registrationViewComponent, modularTransitionStyle: .flipHorizontal) as? RegistrationViewComponent {
            viewComponent.present(registrationViewComponent, animated: true)
        }
    }
    
    func openRouteToUniqueProjectAfterLoginViewComponent(_ viewComponent: LoginViewComponent) {
        if let uniqueProjectViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.mainProjects, .uniqueProjectViewComponent, modularTransitionStyle: .flipHorizontal) as? UniqueProjectViewComponent {
            viewComponent.present(uniqueProjectViewComponent, animated: true)
        }
    }
}
