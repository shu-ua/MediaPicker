//
//  AssetService.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/2/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import Foundation
import Photos

typealias AssetFetchCompletion = (_ assets: [PHAsset]) -> Void

class AssetManager {
    
    /**
     Fetch assets from photo gallery on current device.
     - Parameters:
        - configuration: Configuration file with have all fetch options.
        - completion: Completion block with return array of assets.
    */
    class func fetch(withConfiguration configuration: Configuration, _ completion: AssetFetchCompletion) {
        
        guard  PHPhotoLibrary.authorizationStatus() == .authorized else {
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            let options = assetFetchOptions(fromConfiguration: configuration)
            PHAsset.fetchAssets(with: options)
        }
    }
    
    /**
    Convert configuration variables to PHFetchOptions
     */
    private class func assetFetchOptions(fromConfiguration configuration: Configuration) -> PHFetchOptions {
        let options = PHFetchOptions()
        return options
    }
    
}
