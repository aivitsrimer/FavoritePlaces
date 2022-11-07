//
//  StorageManager.swift
//  FavoritePlaces
//
//  Created by Anna Vits-Rimer on 24.10.22.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        try! realm.write {
            realm.add(place)
        }
    }
}

