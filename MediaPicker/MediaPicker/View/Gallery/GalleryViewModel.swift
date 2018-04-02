//
//  GalleryViewModel.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/2/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import Foundation
import Photos
import RxSwift

struct GalleryViewModel {
    
    let configuration: Configuration
    
    var assets: Variable<[PHAsset]> = Variable([])
    
    //MARK: - Initialization
    init(configuration: Configuration = Configuration()) {
        self.configuration = configuration
    }
    
    //MARK: - Methods
    
    /**
     Fetch PHAsset based on Configuration.
    */
    mutating func fetchAssets() {
        AssetManager.fetch(withConfiguration: configuration) { (assets) in
            self.assets.value = assets
        }
    }
    
}
