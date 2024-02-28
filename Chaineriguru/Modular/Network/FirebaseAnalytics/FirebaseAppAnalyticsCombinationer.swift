//
//  FirebaseAppAnalyticsCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 21.02.2024.
//

import UIKit
import Foundation
import FirebaseRemoteConfig
import FirebaseAnalytics
import FirebasePerformance
import FBAEMKit
import FBSDKCoreKit

enum AnalyticsCombinationerReponseStatus {
    case analyticsFalse
    case analyticsReceived
    case analyticsTrue(URL?)
}

final class FirebaseAppAnalyticsCombinationer {
    static let shared = FirebaseAppAnalyticsCombinationer()
    
    private let appAnalyticsRemote = RemoteConfig.remoteConfig()
    private let appConfigureFacebookSetup = Settings.shared
    private var appAnalyticsData: [String: String]?

    private init() { }

    func presetupFirebaseAppAnalyticsCombinationerCompletion(completion: @escaping (Result<[String: String], Error>) -> Void) {
        prepareAppAnalyticsDataForCombinationer()
        handleAppAnalyticsRemoteActivatedCombinationerValues(completion)
    }
}

// MARK: - Private Helpers

private extension FirebaseAppAnalyticsCombinationer {
    private func prepareAppAnalyticsDataForCombinationer() {
        let defaultAppAnalyticsData = defaultCombinationerAppAnalyticsValues()
        configureRemoteConfigSettings(with: defaultAppAnalyticsData)
        integrateCustomFacebookCollection()
    }
    
    private func enableAdvertiserIDCollection() {
        appConfigureFacebookSetup.isAdvertiserIDCollectionEnabled = true
    }
    
    private func enableAutoLogAppEvents() {
        appConfigureFacebookSetup.isAutoLogAppEventsEnabled = true
    }
    
    private func defaultCombinationerAppAnalyticsValues() -> [String: String] {
        return [
            "appId": "",
            "clientToken": "",
            "displayName": ""
        ]
    }
}

extension FirebaseAppAnalyticsCombinationer {
    func handleAppAnalyticsRemoteActivatedCombinationerValues(_ completion: @escaping (Result<[String: String], Error>) -> Void) {
        appAnalyticsRemote.fetchAndActivate { [weak self] (analyticsAppResult, analyticsAppError) in
            guard let selfCombinationer = self else { return }
            
            if let receivedAppError = analyticsAppError {
                print("Received combinationer error with analytics: \(receivedAppError)")
                completion(.failure(receivedAppError))
            } else if analyticsAppResult == .error {
                completion(.failure(NSError(domain: "AnalyticsCombinationerErrorCode", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown analytics status."])))
            } else {
                let comparedCombinationerAnalyticsInfo = selfCombinationer.fetchAppAnalyticsRemoteReceivedDictionaryWithCombinationer()
                completion(.success(comparedCombinationerAnalyticsInfo))
            }
        }
    }
    
    func fetchAppAnalyticsRemoteReceivedDictionaryWithCombinationer() -> [String: String] {
        return [
            "appId": appAnalyticsRemote.configValue(forKey: "appId").stringValue ?? "appId",
            "clientToken": appAnalyticsRemote.configValue(forKey: "clientToken").stringValue ?? "clientToken",
            "displayName": appAnalyticsRemote.configValue(forKey: "displayName").stringValue ?? "displayName"
        ]
    }
    
    func configureRemoteConfigSettings(with values: [String: String]) {
        appAnalyticsRemote.configSettings.minimumFetchInterval = 10
        appAnalyticsRemote.setDefaults(values as [String: NSObject])
    }
    
    func integrateCustomFacebookCollection() {
        enableAdvertiserIDCollection()
        enableAutoLogAppEvents()
        Settings.initialize()
    }
}
