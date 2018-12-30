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

struct AssetsListViewModel {
    
    let configuration: Configuration
    let assetsListCollumnCount: Double = 4
    
    var assets: Variable<[PHAsset]> = Variable([])
    var phAuthStatus: Variable<PHAuthorizationStatus?> = Variable(nil)
    
    
    //MARK: - Initialization
    init(configuration: Configuration = Configuration()) {
        self.configuration = configuration
    }
    
    //MARK: - Methods
    
    /**
     Fetch PHAsset based on Configuration.
    */
    func fetchAssets() {
        AssetManager.fetch(withConfiguration: configuration) { (assets) in
            self.assets.value = assets
        }
    }
    
    //MARK: - PHAuthorization
    /**
     Check current authorization status of PHLibrary. If not determined - reqeust user for authorization.
     */
    func checkPhLibraryAuthorization() {
        let currentStatus = PHPhotoLibrary.authorizationStatus()
        phAuthStatus.value = currentStatus
        
        guard currentStatus != .authorized else {
            return
        }
        
        PHPhotoLibrary.requestAuthorization { (authStatus) in
            self.phAuthStatus.value = authStatus
        }
    }
    
}
