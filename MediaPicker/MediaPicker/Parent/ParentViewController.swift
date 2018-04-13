//
//  ParentViewController.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/13/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ParentViewController {
    
    /**
     Add child view controller to container on current VC.
    */
    func addChildViewController(toContainer container: UIView, withViewController childVC: UIViewController) {
        addChildViewController(childVC)
        view.addSubview(childVC.view)
        childVC.didMove(toParentViewController: self)
    }
    
    /**
     Removing child view controller from current VC.
    */
    func removeChildViewController(_ childVC: UIViewController) {
        childVC.willMove(toParentViewController: nil)
        childVC.removeFromParentViewController()
        childVC.view.removeFromSuperview()
    }
    
}
