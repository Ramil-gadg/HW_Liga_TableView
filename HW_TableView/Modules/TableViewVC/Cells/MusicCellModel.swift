//
//  MusicCellModel.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 12.03.2022.
//

import UIKit

protocol MusicCellModelDelegate {
    func voit(with title: String?)
}

final class MusicCellModel {
    
    static var identifier: String {
        String(describing: MusicCell.self)
    }
    
    var delegate: MusicCellModelDelegate?
    
    private let model: MusicModel
    
    var title: String
    var rating: Int
    
    var image: UIImage? {
        return UIImage(named: model.imageString)
    }
    
    init(model: MusicModel) {
        self.model = model
        self.rating = model.rating
        self.title = model.title
    }
}
