//
//  Gif.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import RealmSwift

// MARK: - Element
final class Gif: Object {
    @objc dynamic var searchText: String = ""
    @objc dynamic var imageURL: String = ""
}

//MARK: - Aciton
extension Gif {
    static func getGifs() -> [Gif] {
        var all: [Gif] = []
        do{
            let realm = try Realm()
            try realm.write {
                all = Array(realm.objects(Gif.self))
            }
        }catch {
            print("Error in access list of addresses")
        }
        return all
    }
    
    func clearAll() {
        let realm = try! Realm()
        try! realm.write {
            let gifs = realm.objects(Gif.self)
            
            realm.delete(gifs)
        }
    }
}

