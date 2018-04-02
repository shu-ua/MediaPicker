//
//  MediaPickerViewModel.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/1/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import Foundation
import RxSwift

struct MediaPickerViewModel {

    let configuration: Configuration
    
    //MARK: - Initialization
    init(configuration: Configuration = Configuration()) {
        self.configuration = configuration
    }
    
}
