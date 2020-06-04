//
//  StartedViewController.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/4/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit

class StartedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        perform(#selector(StartedViewController.showHome), with: nil, afterDelay: 3)
    
    }
    @objc func showHome() {
        
    }
    
    
}
