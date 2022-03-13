//
//  DataFetcher.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 12.03.2022.
//

import UIKit

class DataFetcher {
    
    func fetchData(completion: @escaping  ([Musics]) -> Void) {
        // fetching data from server
        
        completion(self.musics)
    }
    
    var musics = [
        Musics.hipHop(
            MusicStyle(
                title: "Hip-Hop!",
                musics: [
                    MusicModel(imageString: "hip_hop_1", title: "Hip Hop Music First First First First", rating: 3),
                    MusicModel(imageString: "hip_hop_2", title: "Hip Hop Music Second", rating: 1),
                    MusicModel(imageString: "hip_hop_3", title: "Hip Hop Music Third", rating: 5)
                ]
            )
        ),
        
        Musics.pop(
            MusicStyle(
                title: "Pop!",
                musics: [
                    MusicModel(imageString: "pop_1", title: "Pop Music First", rating: 4),
                    MusicModel(imageString: "pop_2", title: "Pop Music Second", rating: 3),
                    MusicModel(imageString: "pop_3", title: "Pop Music Third", rating: 4)
                ]
            )
        ),
        
        Musics.rock(
            MusicStyle(
                title: "Rock!",
                musics: [
                    MusicModel(imageString: "rock_1", title: "Rock Music First", rating: 1),
                    MusicModel(imageString: "rock_2", title: "Rock Music Second", rating: 5),
                    MusicModel(imageString: "rock_3", title: "Rock Music Third", rating: 3)
                ]
            )
        )
    ]
}
