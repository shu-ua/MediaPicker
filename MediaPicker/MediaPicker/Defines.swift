//
//  Defines.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/3/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import Foundation
import Photos

enum AssetType {
    case image
    case video
    case unknown //Type not supported by this POD
    
    init(fromMediaType mediaType: PHAssetMediaType) {
        switch mediaType {
        case .image:
            self = .image
        case .video:
            self = .video
        default:
            self = .unknown
        }
    }
}
