//
//  SingleUserController.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import UIKit
import MapKit

class SingleUserController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var saveUserButton: UIButton!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        title = "\(user.name.first) \(user.name.last)"
        
        configureMapView()
        imageVIew.setImage(url: URL(string: user.picture.large))
        nameLabel.text = user.getName()
        infoLabel.text = user.getInfo()
    }
    
    private func configureMapView() {
        let center = CLLocationCoordinate2D(latitude: user.location.coordinates.latitude, longitude: user.location.coordinates.longitude)
        mapView.setCenter(center, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func saveUserAction(_ sender: Any) {
    }
    
    @IBAction func removeUserAction(_ sender: Any) {
    }
}
