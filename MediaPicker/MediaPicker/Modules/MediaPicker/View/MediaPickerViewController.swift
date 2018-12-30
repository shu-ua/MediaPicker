//
//  MediaPickerViewController.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/1/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import UIKit
import RxSwift
import Photos

class MediaPickerViewController: ParentViewController {
    
    static let nibName = "MediaPickerViewController"
    
    private var viewModel: MediaPickerViewModel
    
    @IBOutlet private var listContainer: UIView!
              private var assetsListVC: AssetsListViewController?
    
    let disposeBag = DisposeBag()
    
    //MARK: - Initialization
    public init(configuration: Configuration = Configuration()) {
        viewModel = MediaPickerViewModel(configuration: configuration)
        super.init(nibName: MediaPickerViewController.nibName, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.viewModel = MediaPickerViewModel()
        super.init(coder: aDecoder)
    }
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MediaPicker"
        initViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Init views
    private func initViews() {
        initAssetsListView()
    }
    
    private func initAssetsListView() {
        self.assetsListVC = AssetsListViewController(nibName: AssetsListViewController.nibName, bundle: nil)
        addChildViewController(toContainer: listContainer, withViewController: self.assetsListVC!)
    }

}


