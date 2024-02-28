//
//  AppDelegate.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 14.02.2024.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import Firebase
import Foundation
import AppTrackingTransparency
import FBSDKCoreKit
import FirebaseCore
import FirebaseAnalytics
import OneSignalFramework

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        preintegrateOneSignalPermissionSetup(applicationOptions: launchOptions)
        launchActiveKeyboardManager()
        
        setupFacebookLaunchIntegration(application)
        preconfigureFirebaseLibraryConfigInstallation()
        return true
    }
    
    @objc private func handleAppTrackingApplicationRequest() {
        preintegrateAppTrackingRequestPermissionSetup { (handleSuccesStatus) in
            if handleSuccesStatus {
                self.preinitializeOneSignalPermissionSetup {
                    print("OneSignal permission requested.")
                }
            } else {
                self.preinitializeOneSignalPermissionSetup {
                    print("OneSignal permission requested.")
                }
            }
            print("App Tracking authorization requested.")
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        observeAppTrackingAuthorization()
    }
}

fileprivate extension AppDelegate {
    private func preintegrateAppTrackingRequestPermissionSetup(_ completion: @escaping (Bool) -> ()) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                completion(status == .authorized)
            }
        } else {
            completion(true)
        }
    }
    
    private func preinitializeOneSignalPermissionSetup(_ completion: @escaping () -> ()) {
        OneSignal.Notifications.requestPermission { _ in
            completion()
        }
    }
    
    private func setupFacebookLaunchIntegration(_ application: UIApplication) {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: nil)
    }
    
    private func observeAppTrackingAuthorization() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleAppTrackingApplicationRequest), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
}

private extension AppDelegate {
    private func preintegrateOneSignalPermissionSetup(applicationOptions configured: [UIApplication.LaunchOptionsKey: Any]?) {
        OneSignal.initialize("c0acc03c-8741-46e0-91b8-9da9c77f6d72", withLaunchOptions: configured)
    }
    
    private func preconfigureFirebaseLibraryConfigInstallation() {
        FirebaseApp.configure()
        print("Firebase app configured!")
        FirebaseAppAnalyticsCombinationer.shared.presetupFirebaseAppAnalyticsCombinationerCompletion { (analyticsSuccess) in
            print("Analytics setup success!")
        }
    }
    
    private func launchActiveKeyboardManager() {
        IQKeyboardManager.shared.enableDebugging = true
        IQKeyboardManager.shared.enable = true
    }
}

