//
//  GiphyListController.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import UIKit

class GiphyListController: UIViewController {
    
    private lazy var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .white
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Search Gif"
        searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 15, vertical: 0)
        
        searchBar.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        searchBar.layer.borderWidth = 1
        searchBar.layer.cornerRadius = 26
        searchBar.layer.masksToBounds = true
        
        searchBar.setImage(UIImage(named: "icn_back_gray"), for: .search, state: .normal)
        searchBar.delegate = self
        
        var textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .black
        textFieldInsideSearchBar?.backgroundColor = .white
        textFieldInsideSearchBar?.font = UIFont.systemFont(ofSize: 16)
        
        return searchBar
    }()
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GifCell.self, forCellWithReuseIdentifier: App.CellIdentifier.gifCellId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        collectionView.alwaysBounceVertical = true
        
        return collectionView
    }()
    
    private lazy var loader: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.color = .black
        view.hidesWhenStopped = true
        return view
    }()
    
    var router: CoordinatorProtocol
    private let viewModel: GiphyViewModel
    var gifs : [Gif] = []
    
    // MARK: - Init
    init(viewModel: GiphyViewModel, router: CoordinatorProtocol) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        configUI()
    }
}

//MARK: - Methods
extension GiphyListController {
    func searchGif(_ text: String) {
        loader.startAnimating()
        viewModel.searchGif(name: text) { [weak self] in
            guard let `self` = self else {return}
            DispatchQueue.main.async {
                self.setData()
            }
            
        } _: { [weak self] (errorMessage) in
            guard let `self` = self else {return}
            self.showError(errorMessage)
        }
    }
    
    func setData() {
        self.gifs = viewModel.getSavedGifs()
        self.collectionView.reloadData()
        self.searchBar.text = ""
        loader.stopAnimating()
    }
}


extension GiphyListController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        searchGif(text)
    }
}


//MARK: CollectionViewDelegate
extension GiphyListController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.backgroundColor = .white
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: App.CellIdentifier.gifCellId, for: indexPath) as! GifCell
        let gif = gifs[indexPath.row]
        cell.setCell(gif)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (App.ScreenSize.width / 3) - 1
        let cellSize = CGSize(width: size, height: size)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
    
}

//MARK: - UI
extension GiphyListController {
    
    private func configUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "Gifs"
        searchBar
            .add(toSuperview: view)
            .height(52)
            .pinEdgeToSuperview(.left, withInset: 16, respectingGuide: .safeAreaLayout)
            .pinEdgeToSuperview(.right, withInset: 16, respectingGuide: .safeAreaLayout)
            .pinEdgeToSuperview(.top, withInset: 25, respectingGuide: .safeAreaLayout)
        
        collectionView.add(toSuperview: view)
                      .pinEdgeToSuperview(.top, withInset: 90, respectingGuide: .safeAreaLayout)
                      .pinEdgeToSuperview(.left, withInset: 0, respectingGuide: .safeAreaLayout)
                      .pinEdgeToSuperview(.right, withInset: 0, respectingGuide: .safeAreaLayout)
                      .pinEdgeToSuperview(.bottom, withInset: 0, respectingGuide: .safeAreaLayout)
        
        loader.add(toSuperview: view).centerInSuperview().height(40).width(40)
    }
}

