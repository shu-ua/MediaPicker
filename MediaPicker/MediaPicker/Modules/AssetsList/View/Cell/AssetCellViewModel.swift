//
//  AssetCellViewModel.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/2/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import Foundation
import Photos
import RxSwift

class AssetCellViewModel {
    
    var assetType: Variable<AssetType?> = Variable(nil)
    var assetImage: Variable<UIImage?> = Variable(nil)
    var videoDuration: Variable<TimeInterval?> = Variable(nil)
    
    private let imageSize: CGSize
    private var asset: PHAsset {
        didSet {
            self.updateAssetsVariable()
        }
    }
    
    //MARK: - Initialization
    init(asset: PHAsset, imageSize: CGSize = CGSize(width: 720, height: 720)) {
        self.asset = asset
        self.imageSize = imageSize
        
        self.updateAssetsVariable()
    }
    
    //MARK: - Methods
    private func updateAssetsVariable() {
        self.assetType.value = AssetType(fromMediaType: self.asset.mediaType)
        
        AssetManager.getImages(fromPHAsset: asset, imageSize: imageSize) { (image) in
            self.assetImage.value = image
        }
        
        if assetType.value == .video {
            self.videoDuration.value = asset.duration
        }
    }
    
}
