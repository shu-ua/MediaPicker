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
typealias ImageFromPHAssetCompletion = (_ assetImage: UIImage?) -> Void

class AssetManager {
    
    /**
     Fetch assets from photo gallery on current device.
     - Parameters:
        - configuration: Configuration file with have all fetch options.
        - completion: Completion block with return array of assets.
    */
    class func fetch(withConfiguration configuration: Configuration, completion: @escaping AssetFetchCompletion) {
        
        guard  PHPhotoLibrary.authorizationStatus() == .authorized else {
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            let options = assetFetchOptions(fromConfiguration: configuration)
            let fetchResult = PHAsset.fetchAssets(with: options)
            var assets = [PHAsset]()
            fetchResult.enumerateObjects({ (asset, _, _) in
                assets.append(asset)
            })
            
            DispatchQueue.main.async {
                completion(assets)
            }
        }
    }
    
    /**
     Fetch image from PHAsset.
     - Parameters:
     - phAsset: PHAsset object to image.
     - imageSize: expected size of image(720 x 720 by default)
     - fastFormat: directed to faster request, if false - returns the best quality image. (false by default)
     - completion: completion block, returns Optional value of requested Image
    */
    class func getImages(fromPHAsset phAsset: PHAsset, imageSize: CGSize = CGSize(width: 720, height: 720), fastFormat: Bool = false, completion: @escaping ImageFromPHAssetCompletion) {
        
        DispatchQueue.global(qos: .background).async {
            
            let requestOptions = PHImageRequestOptions()
            requestOptions.deliveryMode = fastFormat ? .fastFormat : .highQualityFormat
            requestOptions.isNetworkAccessAllowed = true
            
            PHImageManager.default().requestImage(for: phAsset,
                                                  targetSize: imageSize,
                                                  contentMode: PHImageContentMode.aspectFill,
                                                  options: requestOptions,
                                                  resultHandler: { (image, info) in
                                                    DispatchQueue.main.async {
                                                        completion(image)
                                                    }
            })
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
