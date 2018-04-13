//
//  Router.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/13/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import Foundation

protocol RouterID {}

protocol Router {
    
    /**
     Protocol method for routing from baseVC.
     - Parameters:
        - routeID : ID of the route.
        - baseVC : view controller from which the routing is performed.
        - context : context object for transition.
    */
    func route(to routeID: RouterID, from baseVC: ParentViewController, context: Any)
    
}
