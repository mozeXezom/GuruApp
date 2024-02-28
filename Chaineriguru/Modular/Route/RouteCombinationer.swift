//
//  RouteCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 15.02.2024.
//

import Foundation
import UIKit

final class RouteCombinationer: NSObject {
    static let routeInstance = RouteCombinationer()

    private override init() {}

    private let modularPreviews: [ModularComponents.ModularPreview: String] = [
        .userLogin: "UserLogin",
        .mainProjects: "MainProjects",
        .guruMenu: "GuruMenu"
    ]

    private let modularViewComponents: [ModularComponents.ModularViewComponent: String] = [
        .launchViewComponent: "LaunchViewComponentId",
        .loginViewComponent: "LoginViewComponentId",
        .registrationViewComponent: "RegistrationViewComponentId",
        .uniqueProjectViewComponent: "UniqueProjectViewComponentId",
        .optionMenuViewComponent: "OptionMenuViewComponentId",
        .guruSettingsViewComponent: "GuruSettingsViewComponentId",
        .profileGuruViewComponent: "ProfileGuruViewComponentId",
        .guruTemplatesViewComponent: "GuruTemplatesViewComponentId"
    ]

    func didStartViewComponentInitiatation<T: UIViewController>(_ modularPreview: ModularComponents.ModularPreview, _ modularViewComponent: ModularComponents.ModularViewComponent, modularTransitionStyle transition: UIModalTransitionStyle) -> T {
        if let preparedModularPreview = modularPreviews[modularPreview],
           let preparedModularViewComponent = modularViewComponents[modularViewComponent] {
            let modularPreview = UIStoryboard(name: preparedModularPreview, bundle: nil)
            
            if let modularViewComponentToForward = modularPreview.instantiateViewController(withIdentifier: preparedModularViewComponent) as? T {
                modularViewComponentToForward.modalPresentationStyle = .fullScreen
                modularViewComponentToForward.modalTransitionStyle = transition

                return modularViewComponentToForward
            } else {
                fatalError("Modular view component is not prepared correctly!")
            }
        } else {
            fatalError("Error, preparing modular components.")
        }
    }
}
