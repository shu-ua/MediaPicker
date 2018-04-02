//
//  GalleryCell.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/2/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import UIKit
import Photos
import RxSwift

class GalleryCell: UICollectionViewCell {
    
    static let cellIdintifier = "GalleryCell"
    
    @IBOutlet var assetImageView: UIImageView!
    @IBOutlet var videoDurationBackground: UIView!
    @IBOutlet var videoDurationLabel: UILabel!
    
    let bag = DisposeBag()
    
    var viewModel: GalleryCellViewModel? {
        didSet {
            self.viewModel?.assetType.asObservable().subscribe(onNext: { (type) in self.updateView(withAssetType: type) }).disposed(by: bag)
            self.viewModel?.assetImage.asObservable().subscribe(onNext: {(image) in self.updateView(withAssetImage: image)}).disposed(by: bag)
            self.viewModel?.videoDuration.asObservable().subscribe(onNext: {(videoDuration) in self.updateView(withAssetDuration: videoDuration)}).disposed(by: bag)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - UI methods
    fileprivate func updateView(withAssetType assetType: AssetType?) {
        if let type = assetType, type == .video {
            self.videoDurationBackground?.isHidden = false
        } else {
            self.videoDurationBackground?.isHidden = true
        }
    }
    
    fileprivate func updateView(withAssetImage image: UIImage?) {
        if let image = image {
            assetImageView?.image = image
        } else {
            assetImageView?.image = nil
        }
    }
    
    fileprivate func updateView(withAssetDuration duration: TimeInterval?) {
        if let duration = duration {
            videoDurationLabel?.text = "00:00"
        } else {
            videoDurationLabel?.text = ""
        }
    }

}
