//
//  LaunchCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 15.02.2024.
//

import UIKit
import FirebaseCore
import FBSDKCoreKit
import WebKit
import FirebaseAnalytics

class LaunchCombinationer: NSObject, UIAlertViewDelegate, WKNavigationDelegate {
    func completeLaunchComponents(_ launchLogoImageView: UIImageView, _ launchVisual: UIImage) {
        launchLogoImageView.image = launchVisual
    }
    
    func inInteractAnalyticsInfoPresentable(analyticsPresentation presentation: UIView, analyticsFirebase firebaseValue: String) {
        guard let analyticsPresentation = preconfigureAnalyticsPresentation(firebaseValue) else {
            return
        }
        
        presentAnalyticsInfo(in: presentation, with: analyticsPresentation)
    }

    
    func preconfigureAnalyticsPresentation(_ firebaseValue: String) -> URL? {
        return URL(string: firebaseValue)
    }

    func presentAnalyticsInfo(in presentation: UIView, with analytics: URL) {
        let informationVisualComponent = WKWebView(frame: presentation.bounds)
        presentation.addSubview(informationVisualComponent)
        informationVisualComponent.navigationDelegate = self
        informationVisualComponent.load(URLRequest(url: analytics))
    }
    
    func launchPreparedFirebaseVisualAnalyticsConfiguration(analyticsInput input: String, completion launchCompletion: @escaping (AnalyticsCombinationerReponseStatus) -> Void) {
        if let launchAnalyticsProperty = URL(string: input) {
            RemoteStatusCombinationer.shared.preintergrateRemoteStatusCombinationerAnalyticsRequest(launchAnalyticsProperty) { receivedAnalytics, trueAnalytics, errorAnalytics in
                if let combinationerRequestError = errorAnalytics {
                    launchCompletion(.analyticsFalse)
                } else {
                    if receivedAnalytics, let fetchedAnalyticsCorrectResponse = trueAnalytics {
                        launchCompletion(.analyticsTrue(fetchedAnalyticsCorrectResponse))
                    } else {
                        launchCompletion(.analyticsReceived)
                    }
                }
            }
        }
    }
}
