//
//  TestTableViewCell.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/16/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit

protocol DisplaySelectedPhotoDelegate: class {
    func displaySelectedPhoto(_ photo: Photo)
}

final class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var carouselView: iCarousel!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var noOfPhotosLabel: UILabel!
    
    static let nibName = Constants.albumTableViewCellNibName
    
    weak var displaySelectedPhotoDelegate: DisplaySelectedPhotoDelegate?
    
    struct AlbumsViewModel {
        var albumId: Int
        var noOfPhotos: Int = 0
        var photoDisplay: String = ""
        
        init(albumId: Int) {
            self.albumId = albumId
        }
    }
    
    var albumsViewModel: AlbumsViewModel? {
        didSet {
            albumTitleLabel.text = albumsViewModel?.albumIdTextDisplay
            noOfPhotosLabel.text = albumsViewModel?.noOfPhotosDisplay
        }
    }
    
    var photos: [Photo] = [] {
        didSet {
            albumsViewModel?.noOfPhotos = self.photos.count
        }
    }
    
    
    //MARK: Table View Cell Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        carouselView.delegate = self
        carouselView.dataSource = self
        carouselView.type = .rotary
        carouselView.contentMode = .scaleAspectFit
    }
    
}

//MARK: AlbumTableViewCell (iCarousel Implementation)
extension AlbumTableViewCell: iCarouselDelegate, iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return photos.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        //MARK: UIImageView for Carousel
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        let imageView = UIImageView()
        guard let image = photos[index].photoImageUrl else { return UIView() }
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFit
        imageView.sd_setImage(with: URL(string: image))
        
        //MARK: Label for image
        let label = UILabel(frame:  CGRect(x: 0, y: 180, width: 50, height: 10))
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        label.textColor = UIColor.darkGray  
        label.tag = 1
        label.text = String(photos[index].id)
        imageView.addSubview(label)
        
        tempView.addSubview(imageView)
        return tempView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == .spacing {
            return value * 1.1
        }
        return value
    }
    
    //For display photo detail VC
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let photo = photos[index]
        self.displaySelectedPhotoDelegate?.displaySelectedPhoto(photo)
    }
    
    func carousel(_ carousel: iCarousel, shouldSelectItemAt index: Int) -> Bool {
        return true
    }
}

//MARK: AlbumTableViewCell's Albums View Model
extension AlbumTableViewCell.AlbumsViewModel {
    
    var albumIdTextDisplay: String {
        let formatString = NSLocalizedString("ALBUM %@", comment: "...")
        return String(format: formatString, String(albumId))
    }
    
    var noOfPhotosDisplay: String {
        var photoDisplayString = "photo"
        if noOfPhotos > 1 {
            photoDisplayString = "photos"
        }
        let formatString = NSLocalizedString("%@ \(photoDisplayString)", comment: "...")
        return String(format: formatString, String(noOfPhotos))
    }
}






