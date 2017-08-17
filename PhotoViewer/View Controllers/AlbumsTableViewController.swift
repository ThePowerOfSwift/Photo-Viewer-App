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

    let store = AlbumsDataStore.sharedInstance
    var albums: [Album] = []
    var chosenPhoto: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        
        OperationQueue.main.addOperation {
            self.store.getAlbumsFromAPIClient { data in
                self.albums = data
                self.tableView.reloadData()
            }
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
        return self.albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumTableViewCell
        
        //for Display photo Protocol
        cell.displaySelectedPhotoDelegate = self
        
        let album = self.albums[indexPath.row]
        cell.albumsViewModel =
        AlbumTableViewCell.AlbumsViewModel( albumId: album.albumId )
        cell.photos = albums[indexPath.row].photos
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
    
}
