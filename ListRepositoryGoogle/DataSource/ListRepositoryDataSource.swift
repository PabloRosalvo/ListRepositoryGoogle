//
//  ListRepositoryDataSource.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo on 25/01/22.
//

import Foundation
import UIKit

protocol ListDataSourceDelegate: AnyObject {
    func seletectIndexPathRow(_ model: DetailsGitHubModel)
}

final class ListRepositoryDataSource: NSObject, UISearchBarDelegate {
    
    lazy var searchBar : UISearchBar = {
        let s = UISearchBar()
        s.placeholder = "Pesquisar Repositório"
        s.delegate = self
        s.tintColor = .black
        s.barTintColor = .white
        s.barStyle = .black
        s.sizeToFit()
        return s
    }()
    
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

        return viewModel?.dataList?[indexPath.row].name ?? ""
    }
    
    func getImageUser(_ indexPath: IndexPath) -> String {
        return viewModel?.dataList?[indexPath.row].owner?.avatarURL ?? ""
    }
    
    func setViewModel(viewModel: ListRepositoryViewModel) {
        self.viewModel = viewModel
    }
    
    var collectionView: UICollectionView? {
        didSet {
            collectionView?.register(ListRepositoryGoogleCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collectionView?.register(ListRepositoryGoogleCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCellId")

        }
    }
  
}

extension ListRepositoryDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 300, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
               /// 5
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
               /// 6
        return CGSize(width: widthPerItem - 8, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsGitHubModel = DetailsGitHubModel(name: viewModel?.dataList?[indexPath.row].name ?? "",
                                                    image: viewModel?.dataList?[indexPath.row].owner?.avatarURL ?? "",
                                                    description: viewModel?.dataList?[indexPath.row].description ?? "")
        
        self.delegate?.seletectIndexPathRow(detailsGitHubModel)
    }

}

extension ListRepositoryDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel?.dataList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListRepositoryGoogleCollectionViewCell
        cell.setup(nameRepository: getNameRepository(indexPath),
                   imageUrl: getImageUser(indexPath))
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCellId", for: indexPath)
          header.addSubview(searchBar)
          searchBar.translatesAutoresizingMaskIntoConstraints = false
          searchBar.leftAnchor.constraint(equalTo: header.leftAnchor).isActive = true
          searchBar.rightAnchor.constraint(equalTo: header.rightAnchor).isActive = true
          searchBar.topAnchor.constraint(equalTo: header.topAnchor).isActive = true
          searchBar.bottomAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
      return header
    }
    
}
