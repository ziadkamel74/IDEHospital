//
//  HomeCellViewModel.swift
//  IDEHospital
//
//  Created by Ziad on 28/12/2020.
//

import Foundation
import SDWebImage

protocol CategoryCellViewModelProtocol {
    func downloadImage(with item: MainCategoriesData, completion: @escaping (UIImage?) -> Void)
}

class CategoryCellViewModel {
    
}

//MARK:- Cell ViewModel Protocol
extension CategoryCellViewModel: CategoryCellViewModelProtocol {
    func downloadImage(with item: MainCategoriesData, completion: @escaping (UIImage?) -> Void) {
        SDWebImageManager.shared.loadImage(with: URL(string: item.image), options: .highPriority, progress: nil) { (image, _, error, _, _, _) in
            if let error = error {
                print(error.localizedDescription)
            } else if let image = image {
                completion(image)
            }
        }
    }
}
