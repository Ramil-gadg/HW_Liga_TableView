//
//  MusicHeaderModel.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 13.03.2022.
//

import UIKit

protocol MusicHeaderModelDelegate {
    func tappedHeader(with sectionNumber: Int)
}

final class MusicHeaderModel {
    
    static var identifier: String {
        String(describing: MusicCell.self)
    }
    
    var delegate: MusicHeaderModelDelegate?
    
    var sectionNumber: Int
    
    var header: String {
        return model.title
    }
    
    var isSelect: Bool = false
    
    var image: UIImage? {
        return isSelect ?
        UIImage(named: "up") :
        UIImage(named: "down")
    }
    
    let model: MusicStyle
    
    init(model: MusicStyle, number: Int) {
        self.model = model
        self.sectionNumber = number
        self.isSelect = model.selected
    }
}
