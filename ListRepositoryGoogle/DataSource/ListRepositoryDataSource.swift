//
//  ListRepositoryDataSource.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo on 25/01/22.
//

import Foundation
import UIKit

protocol ListDataSourceDelegate: AnyObject {
    func seletectIndexPathRow()
}

final class ListRepositoryDataSource: NSObject {
        
    private weak var delegate: ListDataSourceDelegate?

    private var viewModel: ListRepositoryViewModel? {
        didSet {
            collectionView?.reloadData()
        }
    }
        
    init(delegate: ListDataSourceDelegate) {
        self.delegate = delegate
    }
    
    func getNameRepository(_ indexPath: IndexPath) -> String {
        return viewModel?.modelList?[indexPath.row].name ?? ""
    }
    
    func getImageUser(_ indexPath: IndexPath) -> String {
        return viewModel?.modelList?[indexPath.row].owner.avatarURL ?? ""
    }
    
    func setViewModel(viewModel: ListRepositoryViewModel) {
        self.viewModel = viewModel
    }
    
    var collectionView: UICollectionView? {
        didSet {
            collectionView?.register(ListRepositoryGoogleCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
}

extension ListRepositoryDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
               /// 5
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
               /// 6
        return CGSize(width: widthPerItem - 8, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.seletectIndexPathRow()
    }
}

extension ListRepositoryDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel?.modelList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListRepositoryGoogleCollectionViewCell
        
        cell.setup(nameRepository: getNameRepository(indexPath),
                   imageUrl: getImageUser(indexPath))
        
        return cell
    }
}
