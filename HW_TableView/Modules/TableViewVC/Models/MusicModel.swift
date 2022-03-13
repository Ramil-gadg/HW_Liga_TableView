//
//  MusicModel.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 12.03.2022.
//

import Foundation

enum Musics: Equatable {
    
    case rock(MusicStyle)
    case pop(MusicStyle)
    case hipHop(MusicStyle)
    
    var number: Int {
        switch self {
        case .rock:
            return 0
        case .pop:
            return 1
        case .hipHop:
            return  2
        }
    }
    
    var count: Int {
        switch self {
        case .rock(let rockStyle):
            return rockStyle.musics.count
        case .pop(let popStyle):
            return popStyle.musics.count
        case .hipHop(let hipHopStyle):
            return hipHopStyle.musics.count
        }
    }
    
    mutating func collapse() {
            
            switch self {
            case .rock(let rockStyle):
                var style = rockStyle
                style.collapsed = !rockStyle.collapsed
                style.selected = !rockStyle.selected
                self = .rock(style)
                
            case .pop(let popStyle):
                var style = popStyle
                style.collapsed = !popStyle.collapsed
                style.selected = !popStyle.selected
                self = .pop(style)
                
            case .hipHop(let hipHopStyle):
                var style = hipHopStyle
                style.collapsed = !hipHopStyle.collapsed
                style.selected = !hipHopStyle.selected
                self = .hipHop(style)
            }
    }
    
    static func == (lhs: Musics, rhs: Musics) -> Bool {
        lhs.number == rhs.number
    }
}

struct MusicStyle {
    let title: String
    var selected: Bool = false
    var musics: [MusicModel]
    var collapsed: Bool = true
}

struct MusicModel {
    var imageString: String
    var title: String
    var rating: Int
}

