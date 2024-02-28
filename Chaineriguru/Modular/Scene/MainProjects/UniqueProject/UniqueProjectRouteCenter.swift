//
//  UniqueProjectRouteCenter.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit

class UniqueProjectRouteCenter {
    func openNextRouteToOptionMenuViewComponent(_ viewComponent: UniqueProjectViewComponent) {
        if let nextOptionMenuViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.guruMenu, .optionMenuViewComponent, modularTransitionStyle: .crossDissolve) as? OptionMenuViewComponent {
            viewComponent.present(nextOptionMenuViewComponent, animated: true)
        }
    }
    
    func reloadUniqueProjectViewComponent(_ viewComponent: UniqueProjectViewComponent) {
        if let uniqueProjectViewComponent = RouteCombinationer.routeInstance.didStartViewComponentInitiatation(.mainProjects, .uniqueProjectViewComponent, modularTransitionStyle: .crossDissolve) as? UniqueProjectViewComponent {
            viewComponent.present(uniqueProjectViewComponent, animated: true)
        }
    }
}
