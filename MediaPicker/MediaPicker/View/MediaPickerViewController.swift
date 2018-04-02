//
//  MediaPickerViewController.swift
//  MediaPicker
//
//  Created by Bohdan Shcherbyna on 4/1/18.
//  Copyright © 2018 Bohdan Shcherbyna. All rights reserved.
//

import UIKit

class MediaPickerViewController: UIViewController {
    
    private var viewModel: MediaPickerViewModel
    
    @IBOutlet var galleryButton: UIButton!
    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var videoButton: UIButton!
    
    //MARK: - Initialization
    public init(configuration: Configuration = Configuration()) {
        viewModel = MediaPickerViewModel(configuration: configuration)
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.viewModel = MediaPickerViewModel()
        super.init(coder: aDecoder)
    }
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

