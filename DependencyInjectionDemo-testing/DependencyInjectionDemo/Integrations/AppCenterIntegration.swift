//
//  AppCenterIntegration.swift
//  DependencyInjectionDemo
//
//  Created by Ben Scheirman on 9/10/20.
//

import Foundation
import AppCenter
import AppCenterAnalytics

class AppCenterIntegration: Analytics {
    init(appSecret: String) {
        MSAppCenter.start(appSecret, withServices: [
            MSAnalytics.self
        ])
    }
    
    func track(_ event: Event) {
        MSAnalytics.trackEvent(event.name, withProperties: event.properties)
    }
}
