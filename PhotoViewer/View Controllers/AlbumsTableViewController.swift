//
//  AlbumsTableViewController.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/7/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import SDWebImage
import PinpointKit

class AlbumsTableViewController: UITableViewController {
    
    var albums: [Album] = []
    var chosenPhoto: Photo?
    var chosenAlbum: Int?
    var albumService = AlbumsDataStore()
    
    fileprivate let pinpointKit = PinpointKit(feedbackRecipients: Constants.emailRecipients)
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBAction func feedback(_ sender: Any) {
        pinpointKit.show(from: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXib()
        self.setup()
        
        //Reachability
        if HelperClass.isNetworkReachable {
            HelperClass.stopListening()
            self.getAlbums()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath) as! AlbumTableViewCell
        
        //Display photo protocol
        cell.displaySelectedPhotoDelegate = self
        
        let album = self.albums[indexPath.row]
        cell.albumsViewModel =
            AlbumTableViewCell.AlbumsViewModel( albumId: album.albumId )
        cell.photos = album.photos
        DispatchQueue.main.async {
            cell.carouselView.reloadData()
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! PhotoDetailViewController
        guard let photo = self.chosenPhoto else { return }
        destinationVC.viewModel = DisplayPhoto.PhotoViewModel(photo: photo)
    }
}

//MARK: AlbumsTableViewController
extension AlbumsTableViewController: DisplaySelectedPhotoDelegate {
    
    //MARK: Register Xib
    fileprivate func registerXib() {
        let nibName = UINib(nibName: Constants.albumTableViewCellNibName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: Constants.reuseIdentifier)
    }
    
    fileprivate func setup() {
        //MARK: TableView delegate and datasource
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.contentMode = .scaleAspectFit
        
        //MARK: PinpointKit
        self.tableView.tableFooterView = UIView()
        
        //MARK: Navigation Title View
        let imageView = UIImageView(image: UIImage(named: Constants.lickabilityIconName))
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 40))
        imageView.frame = titleView.bounds
        titleView.addSubview(imageView)
        navBar.titleView = titleView
        
        //MARK: Refresh Controller
        self.refreshControl?.addTarget(self, action: #selector(self.refreshTableView(_:)), for: .valueChanged )
    }
    
    //MARK: Refresh Table View
    func refreshTableView(_ refreshControl: UIRefreshControl) {
        self.getAlbums()
        refreshControl.endRefreshing()
    }
    
    //MARK: - Delegate Implementation
    func displaySelectedPhoto(_ photo: Photo) {
        self.chosenPhoto = photo
        if HelperClass.isNetworkReachable {
            HelperClass.stopListening()
            self.performSegue(withIdentifier: Constants.showPhotoSegue, sender: nil)
        }
    }
    
    //MARK: - Get Albums
    public func getAlbums() {
        OperationQueue.main.addOperation {
            self.albumService.getAlbumsFromAPIClient { [unowned self] (data, error) -> Void in
                guard error == nil else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .cancel, handler:nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil);
                    return
                }
                self.albums = data
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: Header View configurations
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.contentView.alpha = 0.8
        header.contentView.backgroundColor = UIColor.clear
        header.textLabel?.textColor = UIColor.darkGray
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Photo Viewer"
    }

}
