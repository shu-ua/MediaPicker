//
//  MediaPickerViewModel.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/1/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import Foundation

struct MediaPickerViewModel {

    let configuration: Configuration
    
    private let galleryViewModel: GalleryViewModel
    
    //MARK: - Initialization
    init(configuration: Configuration = Configuration()) {
        self.configuration = configuration
        self.galleryViewModel = GalleryViewModel(configuration: configuration)
    }
    
}
