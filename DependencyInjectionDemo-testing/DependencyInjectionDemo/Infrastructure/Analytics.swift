//
//  Analytics.swift
//  DependencyInjectionDemo
//
//  Created by Ben Scheirman on 9/10/20.
//

import Foundation

protocol Analytics {
    func track(_ event: Event)
}

enum Event {
    case viewedScreen(String)
    
    var name: String {
        switch self {
        case .viewedScreen: return "Viewed Screen"
        }
    }
    
    var properties: [String: String]? {
        switch self {
        case .viewedScreen(let screen):
            return ["Screen": screen]
        }
    }
}
