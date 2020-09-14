//
//  ViewControllerTests.swift
//  DependencyInjectionDemoTests
//
//  Created by Ben Scheirman on 9/14/20.
//

import XCTest
import Resolver
@testable import DependencyInjectionDemo

class MockAnalytics: Analytics {
    var events: [Event] = []
    
    func track(_ event: Event) {
        events.append(event)
    }
}

class MockLogging: Logging {
    var messages: [String] = []
    
    func log(_ level: LogLevel, _ message: String, file: StaticString, line: UInt) {
        messages.append(message)
    }
}

extension Resolver {
    static let mock = Resolver()
    
    static func registerMocks() {
        mock.register { MockAnalytics() }
            .implements(Analytics.self)
            .scope(cached)
        
        mock.register { MockLogging() }
            .implements(Logging.self)
            .scope(cached)
    }
}

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!

    override func setUpWithError() throws {
        Resolver.registerMocks()
                
        Resolver.root = Resolver.mock
        
        viewController = ViewController()
    }

    override func tearDownWithError() throws {
        Resolver.root = Resolver.main
        Resolver.cached.reset()
    }

    func testLogsMessagesInViewDidLoad() throws {
        _ = viewController.view
        
        let log: MockLogging = Resolver.resolve()
        XCTAssertEqual(log.messages.count, 2)
        
        let first = try XCTUnwrap(log.messages.first)
        let second = try XCTUnwrap(log.messages.last)
        
        XCTAssertEqual(first, "This is a debug message")
        XCTAssertEqual(second, "This is an info message")
    }

    func testSendsViewedScreenEvent() throws {
        viewController.viewWillAppear(true)
        
        let analytics: MockAnalytics = Resolver.resolve()
        XCTAssertEqual(analytics.events.count, 1)
        
        let event = try XCTUnwrap(analytics.events.first)
        XCTAssertEqual(event.name, "Viewed Screen")
        XCTAssertEqual(event.properties, ["Screen": "Main Screen"])
    }

}
