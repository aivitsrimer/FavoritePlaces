//
//  ViewController.swift
//  FavoritePlaces
//
//  Created by Anna Vits-Rimer on 16.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    let restaurantNames = [
//        "Stamba",
//        "Lolita",
//        "Frida's Cafe",
//        "Blamanje",
//        "Fabrika",
//        "Tsiskari",
//        "Puri Guliani",
//        "Entree",
//        "Iveria",
//        "Lui Coffee"
//    ]
//
//    var places = [
//        Place(name: "Stamba", type: "Restaurant", location: "Tbilisi", restaurantImage: "Stamba"),
//        Place(name: "Lolita", type: "Restaurant", location: "Tbilisi", restaurantImage: "Lolita"),
//        Place(name: "Frida's Cafe", type: "Cafe", location: "Tbilisi", restaurantImage: "Frida's Cafe"),
//        Place(name: "Blamanje", type: "Cafe", location: "Tbilisi", restaurantImage: "Blamanje"),
//        Place(name: "Fabrika", type: "Cafe", location: "Tbilisi", restaurantImage: "Fabrika"),
//        Place(name: "Tsiskari", type: "Bar", location: "Tbilisi", restaurantImage: "Tsiskari"),
//        Place(name: "Puri Guliani", type: "Cafe", location: "Tbilisi", restaurantImage: "Puri Guliani"),
//        Place(name: "Entree", type: "Cafe", location: "Tbilisi", restaurantImage: "Entree"),
//        Place(name: "Iveria", type: "Cafe", location: "Tbilisi", restaurantImage: "Iveria"),
//        Place(name: "Lui Coffee", type: "Cafe", location: "Tbilisi", restaurantImage: "Lui Coffee"),
//    ]
    
    var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if places.isEmpty {
//            let newPlace = Place()
//            DispatchQueue.main.async {
//                newPlace.savePlaces()
//            }
//        }
    }
}

// MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
//        cell.cafeImage.image = place.image == nil ? UIImage(named: place.restaurantImage!) : place.image
//        cell.cafeImage = place.imageData
        cell.typeLabel.text = place.type
        cell.locationLabel.text = place.location
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
}

// MARK: - Segue
extension ViewController {
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        
        newPlaceVC.saveNewPlace()
        places.append(newPlaceVC.newPlace)
        tableView.reloadData()
    }
}
