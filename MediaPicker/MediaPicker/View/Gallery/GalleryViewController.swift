//
//  GalleryViewController.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/2/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Photos

final class GalleryViewController: UIViewController {
    
    private var viewModel: GalleryViewModel
    let bag = DisposeBag()
    
    @IBOutlet var assetsCollectionView: UICollectionView!
    
    //MARK: - Initialization
    public init(configuration: Configuration = Configuration()) {
        viewModel = GalleryViewModel(configuration: configuration)
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = GalleryViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.viewModel = GalleryViewModel()
        super.init(coder: aDecoder)
    }
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.viewModel.checkPhLibraryAuthorization()
    }
    
    //MARK: - Setup Views
    
    private func setupViews() {
        self.setupAssetsCollectionView()
        
        self.viewModel.phAuthStatus.asObservable().subscribe(onNext: { (newStatus) in
            self.updateViewWithPhotoLibraryAuthStatus()
        }).disposed(by: bag)
    }
    
    //MARK: - PHAuthorization
    private func updateViewWithPhotoLibraryAuthStatus() {
        
        if let status = self.viewModel.phAuthStatus.value {
            if  status == .authorized {
                self.viewModel.fetchAssets()
            } else {
                print("show No restiction VC")
            }
        }
    }
}

//MARK: - Asset Collection View
extension GalleryViewController: UICollectionViewDelegate {
    
    fileprivate func setupAssetsCollectionView() {
        self.assetsCollectionView.register(UINib(nibName: GalleryCell.cellIdintifier, bundle: Bundle(for: self.classForCoder)), forCellWithReuseIdentifier: GalleryCell.cellIdintifier)
        self.assetsCollectionView.rx.setDelegate(self).disposed(by: bag)
        
        self.viewModel.assets.asObservable().bind(to: self.assetsCollectionView.rx.items) { (collectionView, row, asset) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.cellIdintifier, for: IndexPath(row : row, section : 0)) as! GalleryCell
            self.updateAssetCollectionViewCell(cell: cell, withAsset: asset)
            print(asset)
            return cell
            }.disposed(by: bag)
    }
    
    fileprivate func updateAssetCollectionViewCell(cell: GalleryCell, withAsset asset: PHAsset) {
        let cellViewModel = GalleryCellViewModel(asset: asset)
        cell.viewModel = cellViewModel
    }
    
}


