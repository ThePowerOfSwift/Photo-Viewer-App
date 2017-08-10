//
//  PhotoDetailViewController.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/9/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import SDWebImage
//import NYTPhotoViewer

class PhotoDetailViewController: UIViewController {

//    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var imageView: UIView!
    
    var photo: Photo?
    var displayPhoto = DisplayPhoto()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let display = photo else { return }
        displayPhoto.photoViewModel = DisplayPhoto.PhotoViewModel(photo: display)
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupViews() {
        
        photoTitleLabel.text = displayPhoto.photoViewModel?.photo.title
//        albumNameLabel.text = "Album \(photoViewModel?.photo.)"
    }
}

