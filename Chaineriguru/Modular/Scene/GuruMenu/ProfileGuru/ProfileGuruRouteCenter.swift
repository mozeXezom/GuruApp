//
//  ProfileGuruRouteCenter.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 20.02.2024.
//

import UIKit

class ProfileGuruRouteCenter {
    func openInRouteToOptionMenuViewComponent(_ viewComponent: ProfileGuruViewComponent) {
        if let inOptionMenuViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.guruMenu, .optionMenuViewComponent, modularTransitionStyle: .crossDissolve) as? OptionMenuViewComponent {
            viewComponent.present(inOptionMenuViewComponent, animated: true)
        }
    }
}
