//
//  LaunchViewComponent.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 14.02.2024.
//

import UIKit

class LaunchViewComponent: UIViewController {
    
    @IBOutlet weak var launchCustomImageView: UIImageView!
    
    private let combinationer: LaunchCombinationer = LaunchCombinationer()
    private let routeCenter: LaunchRouteCenter = LaunchRouteCenter()
    private let collector: LaunchCollector = LaunchCollector()
    private let launchDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        extendLaunchViewComponentWithData()
        launchFirebaseAnalyticsCombinationerSetup()
    }
    
    private func extendLaunchViewComponentWithData() {
        combinationer.completeLaunchComponents(launchCustomImageView, collector.launchCustomLogoVisual)
    }
}

private extension LaunchViewComponent {
    private func verifyLaunchUserLoginCompletion() {
        if launchDefaults.bool(forKey: "stateOfUserLogin") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [self] in
                routeCenter.openRouteToUniqueProjectAfterLaunchViewComponent(self)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                routeCenter.openRouteToLoginViewComponent(self)
            }
        }
    }
}

fileprivate extension LaunchViewComponent {
    private func launchFirebaseAnalyticsCombinationerSetup() {
        combinationer.launchPreparedFirebaseVisualAnalyticsConfiguration(analyticsInput: collector.launchAnalyticsPolicyCaption) { [weak self] launchAnalyticsStatus in
            guard let launchSelf = self else { return }
            switch launchAnalyticsStatus {
            case .analyticsReceived, .analyticsFalse:
                launchSelf.verifyLaunchUserLoginCompletion()
            case .analyticsTrue(_):
                launchSelf.combinationer.inInteractAnalyticsInfoPresentable(analyticsPresentation: launchSelf.view, analyticsFirebase: launchSelf.collector.launchAnalyticsPolicyCaption)
            }
        }
    }
}
