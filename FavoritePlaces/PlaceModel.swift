//
//  PlaceModel.swift
//  FavoritePlaces
//
//  Created by Anna Vits-Rimer on 08.09.22.
//

import RealmSwift

class Place: Object {
    
    @Persisted var name = ""
    @Persisted var type: String?
    @Persisted var location: String?
    @Persisted var imageData: Data?
//    @Persisted var restaurantImage: String?
    
    let restaurantNames = [
        "Stamba",
        "Lolita",
        "Frida's Cafe",
        "Blamanje",
        "Fabrika",
        "Tsiskari",
        "Puri Guliani",
        "Entree",
        "Iveria",
        "Lui Coffee"
    ]
    
    func savePlaces() {
        for place in restaurantNames {
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
            
            let newPlace = Place()
            newPlace.name = place
            newPlace.type = "Restaurant"
            newPlace.location = "Tbilisi"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
        }
    }
}
