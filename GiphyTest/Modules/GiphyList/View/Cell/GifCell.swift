//
//  GifCell.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import UIKit
import EasySwiftLayout

class GifCell : UICollectionViewCell {
    
    lazy var photoImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var gifsName : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = UIColor.white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Methods
extension GifCell {
    func setCell(_ item: Gif) {
        gifsName.text = item.searchText
        let imageURL = UIImage.gifImageWithURL(item.imageURL)
        photoImageView.image = imageURL
    }
}


//MARK: - ConfigUI
extension GifCell {
    
    func configUI() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        photoImageView.add(toSuperview: self)
                          .pinEdgeToSuperview(.top, withInset: 0, respectingGuide: .safeAreaLayout)
                          .pinEdgeToSuperview(.left, withInset: 0, respectingGuide: .safeAreaLayout)
                          .pinEdgeToSuperview(.right, withInset: 0, respectingGuide: .safeAreaLayout)
                          .pinEdgeToSuperview(.bottom, withInset: 15, respectingGuide: .safeAreaLayout)
        
        gifsName.add(toSuperview: self)
                      .pinEdgeToSuperview(.left, withInset: 0, respectingGuide: .safeAreaLayout)
                      .pinEdgeToSuperview(.right, withInset: 0, respectingGuide: .safeAreaLayout)
                      .pinEdgeToSuperview(.bottom, withInset: 0, respectingGuide: .safeAreaLayout)
    }
}


