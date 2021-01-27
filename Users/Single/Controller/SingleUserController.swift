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
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var saveUserButton: UIButton!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        title = "\(user.name.first) \(user.name.last)"
        
        configureMapView()
        configureSaveButtons()
        
        imageVIew.setImage(url: URL(string: user.picture.large))
        nameLabel.text = user.getName()
        infoLabel.text = user.getInfo()
    }
    
    private func configureMapView() {
        let center = CLLocationCoordinate2D(latitude: user.location.coordinates.latitude, longitude: user.location.coordinates.longitude)
        mapView.setCenter(center, animated: false)
    }
    
    private func configureSaveButtons() {
        UserDataProvider().getSavedUsers().contains(where: { $0.email == user.email }) ? removeState() : saveState()
    }
    
    private func saveState() {
        saveUserButton.setTitle("Save user", for: .normal)
        saveUserButton.backgroundColor = UIColor(named: "UsersGreenColor")
        saveUserButton.isEnabled = true
        removeButton.isHidden = true
    }
    
    private func removeState() {
        saveUserButton.setTitle("User saved", for: .normal)
        saveUserButton.backgroundColor = UIColor(named: "UsersGreyColor")
        saveUserButton.isEnabled = false
        removeButton.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func saveUserAction(_ sender: Any) {
        UserDataProvider().saveUser(user)
        removeState()
    }
    
    @IBAction func removeUserAction(_ sender: Any) {
        UserDataProvider().removeUser(user)
        saveState()
    }
}
