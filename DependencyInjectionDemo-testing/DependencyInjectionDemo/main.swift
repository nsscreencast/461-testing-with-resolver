//
//  main.swift
//  DependencyInjectionDemo
//
//  Created by Ben Scheirman on 9/14/20.
//

import UIKit

let isTesting = NSClassFromString("XCTestCase") != nil

let appDelegateClass = isTesting ?
    TestingAppDelegate.self :
    AppDelegate.self

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(appDelegateClass))
