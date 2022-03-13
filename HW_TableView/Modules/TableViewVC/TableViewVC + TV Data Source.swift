//
//  TableViewVC + TV Data Source.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 13.03.2022.
//

import UIKit

extension TableViewVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.sections.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch sections[section] {
            
        case .rock(let musicStyle):
            return  musicStyle.collapsed ? 0 : musicStyle.musics.count
        case .pop(let musicStyle):
            return musicStyle.collapsed ? 0 : musicStyle.musics.count
        case .hipHop(let musicStyle):
            return musicStyle.collapsed ? 0 : musicStyle.musics.count
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MusicCellModel.identifier,
            for: indexPath) as? MusicCell else {
                
                return UITableViewCell()
            }
        
        let musics = sections[indexPath.section]
        
        var musicModel: MusicModel
        
        switch musics {
            
        case .rock(let musicStyle):
            musicModel = musicStyle.musics[indexPath.row]
        case .pop(let musicStyle):
            musicModel = musicStyle.musics[indexPath.row]
        case .hipHop(let musicStyle):
            musicModel = musicStyle.musics[indexPath.row]
        }
        
        let cellModel = MusicCellModel(model: musicModel)
        cellModel.delegate = self
        cell.configure(with: cellModel)
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: MusicHeaderView.identifier
        ) as? MusicHeaderView else {
            
            return nil
        }
        
        let musics = sections[section]

        var musicStyle: MusicStyle
        
        switch musics {
            
        case .rock(let style):
            musicStyle = style
        case .pop(let style):
            musicStyle = style
        case .hipHop(let style):
            musicStyle = style
        }
        
        let headerModel = MusicHeaderModel(model: musicStyle, number: musics.number)
        headerModel.delegate = self
        headerView.configure(with: headerModel)
        
        return headerView
    }
}
