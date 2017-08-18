//
//  PhotoDetailViewController.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/9/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet var detailView: UIView!
    
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var photo: Photo?
    var displayPhoto = DisplayPhoto()
    var viewModel: DisplayPhoto.PhotoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupViews() {
        
        guard let viewModel = viewModel else { return }
        displayPhoto.photoViewModel = viewModel
        photoTitleLabel.text = displayPhoto.photoViewModel?.photo.title
        guard let thumbnailImage = displayPhoto.thumbnailImageView else { return }
        photoImageView.addSubview(thumbnailImage)
        
        detailView.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.detailView.transform = .identity
        })

        
    }
}

