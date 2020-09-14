//
//  ViewController.swift
//  DependencyInjectionDemo
//
//  Created by Ben Scheirman on 9/10/20.
//

import UIKit
import Resolver

class ViewController: UIViewController {
    
    @Injected
    var analytics: Analytics
    
    @Injected
    var log: Logging

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
    
        log.debug("This is a debug message")
        log.info("This is an info message")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        analytics.track(.viewedScreen("Main Screen"))
    }

}

