//
//  GiphyViewModel.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import RealmSwift

final class GiphyViewModel {
    
}

//MARK: - Methods
extension GiphyViewModel {
    
    func getSavedGifs() -> [Gif] {
        return Array(Gif.getGifs())
    }
    
    private func saveGif(_ searchText: String, _ item: Giphy) {
        let selectedGif = Gif()
        selectedGif.searchText = searchText
        selectedGif.imageURL = item.images.downsized.url
        if let imageURL = UIImage.gifImageWithURL(item.images.downsized.url) {
            let data = NSData(data: imageURL.jpegData(compressionQuality: 0.9)!)
            selectedGif.imageData = data
        }
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(selectedGif)
        }
    }
    
    private func getRandomOne(_ gifs: [Giphy]) -> Giphy {
        return gifs.randomElement()!
    }
}

//MARK: - Request
extension GiphyViewModel {
    func searchGif(name: String, success: @escaping () -> Void, _ failure: @escaping failure) {
        NetworkManager.shared.getGiphy(name: name) { [weak self] (result, error) in
            guard let `self` = self else {return}
            if let error = error {
                failure(error)
                return
            }
            if let gifs = result {
                if gifs.isEmpty {
                    failure("There is no Gifs")
                }else {
                    self.saveGif(name, self.getRandomOne(gifs))
                    success()
                }
            }
        }
    }
}
