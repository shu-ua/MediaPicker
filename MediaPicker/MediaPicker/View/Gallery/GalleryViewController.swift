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
        self.viewModel.fetchAssets()
    }
    
    //MARK: - Setup Views
    func setupViews() {
        self.viewModel.assets.asObservable().bind(to: self.assetsCollectionView.rx.items) { (collectionView, row, element ) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: IndexPath(row : row, section : 0))
            print(row)
            //customize cell
            return cell
            
            }.disposed(by: bag)
    }
    
}


