//
//  TableViewVC + TV Delegate.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 13.03.2022.
//

import UIKit

extension TableViewVC: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        
        return UITableView.automaticDimension

    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return 40
    }
}
