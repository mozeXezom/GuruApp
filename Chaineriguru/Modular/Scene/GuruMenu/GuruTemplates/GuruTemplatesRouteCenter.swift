//
//  GuruTemplatesRouteCenter.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 20.02.2024.
//

import UIKit

class GuruTemplatesRouteCenter {
    func openBackToRouteToOptionMenuViewComponent(_ viewComponent: GuruTemplatesViewComponent) {
        if let backToOptionMenuViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.guruMenu, .optionMenuViewComponent, modularTransitionStyle: .crossDissolve) as? OptionMenuViewComponent {
            viewComponent.present(backToOptionMenuViewComponent, animated: true)
        }
    }
}
