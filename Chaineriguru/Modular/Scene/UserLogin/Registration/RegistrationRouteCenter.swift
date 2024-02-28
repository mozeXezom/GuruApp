//
//  RegistrationRouteCenter.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 18.02.2024.
//

import Foundation
import UIKit

class RegistrationRouteCenter {
    func openBackRouteToLoginViewComponent(_ viewComponent: RegistrationViewComponent) {
        if let backLoginViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.userLogin, .loginViewComponent, modularTransitionStyle: .flipHorizontal) as? LoginViewComponent {
            viewComponent.present(backLoginViewComponent, animated: true)
        }
    }
    
    func openRouteToUniqueProjectAfterRegistrationViewComponent(_ viewComponent: RegistrationViewComponent) {
        if let uniqueProjectViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.mainProjects, .uniqueProjectViewComponent, modularTransitionStyle: .flipHorizontal) as? UniqueProjectViewComponent {
            viewComponent.present(uniqueProjectViewComponent, animated: true)
        }
    }
}
