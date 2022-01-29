//
//  MyFavoriteCellViewModel.swift
//  IDEHospital
//
//  Created by Ziad on 18/12/2020.
//

import Foundation
import SDWebImage

protocol MyFavoriteCellViewModelProtocol {
    func downloadImage(with item: MyFavoriteItem, completion: @escaping (UIImage?) -> Void)
}

class MyFavoriteCellViewModel {
    
}

//MARK:- MyFavoriteCell ViewModel Protocol
extension MyFavoriteCellViewModel: MyFavoriteCellViewModelProtocol {
    func downloadImage(with item: MyFavoriteItem, completion: @escaping (UIImage?) -> Void) {
        SDWebImageManager.shared.loadImage(with: URL(string: item.image), options: .highPriority, progress: nil) { (image, _, error, _, _, _) in
            if let error = error {
                print(error.localizedDescription)
            } else if let image = image {
                completion(image)
            }
        }
    }
}
