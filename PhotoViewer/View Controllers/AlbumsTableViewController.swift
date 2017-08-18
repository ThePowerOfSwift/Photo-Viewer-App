//
//  AlbumsTableViewController.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/7/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import SDWebImage

class AlbumsTableViewController: UITableViewController, DisplaySelectedPhotoDelegate {

    //var dataSource: [Album]?
    var albums: [Album]?
    var chosenPhoto: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        OperationQueue.main.addOperation {
            self.getAlbums()
        }
        self.tableView.delegate = self
        self.tableView.contentMode = .scaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let unwrappedAlbum = self.albums else { return 0 }
        return unwrappedAlbum.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumTableViewCell
        
        //for Display photo Protocol
        cell.displaySelectedPhotoDelegate = self
        guard let unwrappedAlbum = self.albums else { return cell }
        let album = unwrappedAlbum[indexPath.row]
        cell.albumsViewModel =
        AlbumTableViewCell.AlbumsViewModel( albumId: album.albumId )
        cell.photos = album.photos
        DispatchQueue.main.async {
          cell.carouselView.reloadData()
        }
        return cell
    }
    
    //MARK: Helper functions
    private func registerXib() {
        let nibName = UINib(nibName: "AlbumTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "albumCell")
    }
    
    func displaySelectedPhoto(_ photo: Photo) {
        self.chosenPhoto = photo
        self.performSegue(withIdentifier: "showPhoto", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! PhotoDetailViewController
        guard let photo = self.chosenPhoto else { return }
        destinationVC.viewModel = DisplayPhoto.PhotoViewModel(photo: photo)
    }
    
    
    // Used Dependency Injection for testing
    fileprivate func getAlbums(albumService: AlbumsDataStore = AlbumsDataStore()) {
        albumService.getAlbumsFromAPIClient { [unowned self] (albumsDataResult) -> Void in
            switch (albumsDataResult) {
            case .Success(let albums):
                self.albums = albums
                self.tableView.reloadData()
            case .Failure(let error):
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
