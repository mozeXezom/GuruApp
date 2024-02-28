//
//  RemoteStatusCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 21.02.2024.
//

import Foundation
import UIKit
import FirebaseAnalytics
import Foundation

final class RemoteStatusCombinationer: NSObject, URLSessionTaskDelegate {
    static let shared = RemoteStatusCombinationer()
    
    private var combinationerTrueStatus: Bool = false
    private var firebaseAnalyticsType = "Analytics"
    private let remoteCombinationerStatusConfig = URLSessionConfiguration.default
    private var remoteAnalyticsKey = "HEAD"
    private var remoteFetchUrl: URL?
    
    private override init() {
        super.init()
    }
    
    func configureCombinationerSessionTimeout(_ timeoutInterval: TimeInterval) {
        remoteCombinationerStatusConfig.timeoutIntervalForRequest = timeoutInterval
    }
    
    func preintergrateRemoteStatusCombinationerAnalyticsRequest(_ combinationerUrl: URL, completion: @escaping ((analyticsResponseStatus: Bool, engageUrl: URL?, remoteUnknownError: Error?)) -> Void) {
        let intergratedAnalyticsSession = URLSession(configuration: remoteCombinationerStatusConfig, delegate: self, delegateQueue: nil)
        
        let fetchRemoteCombinationerRequest = setupRemoteAnalyticsFetchRequest(analyticsUrl: combinationerUrl)

        let combinationerTask = intergratedAnalyticsSession.dataTask(with: fetchRemoteCombinationerRequest) { [unowned self] combinationerListener, combinationerStatus, combinationerError in
            DispatchQueue.main.async {
                if let taskRemoteError = combinationerError {
                    completion((false, nil, taskRemoteError))
                    return
                }

                if let combinationerResponse = combinationerStatus as? HTTPURLResponse, (300...399).contains(combinationerResponse.statusCode) {
                    self.handleCombinationerReceivedRemoteResponse(receivedResponse: combinationerResponse)
                    completion((true, self.remoteFetchUrl, nil))
                } else {
                    completion((false, nil, nil))
                }
            }
        }
        combinationerTask.resume()
    }
}

private extension RemoteStatusCombinationer {
    private func setupRemoteAnalyticsFetchRequest(analyticsUrl url: URL) -> URLRequest {
        var analyticsFetchRequest = URLRequest(url: url)
        analyticsFetchRequest.httpMethod = remoteAnalyticsKey
        return analyticsFetchRequest
    }
    
    private func handleCombinationerReceivedRemoteResponse(receivedResponse combinationerResponse: HTTPURLResponse?) {
        combinationerTrueStatus = true
        remoteFetchUrl = combinationerResponse?.url
    }
}

extension RemoteStatusCombinationer {
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        handleCombinationerReceivedRemoteResponse(receivedResponse: response)
        completionHandler(nil)
    }
}
