//
//  TableViewVC.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 12.03.2022.
//

import UIKit

class TableViewVC: UIViewController {
    
    private let dataFetcher = DataFetcher()
    
    var sections: [Musics] = []
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.register(
            MusicCell.self,
            forCellReuseIdentifier: MusicCellModel.identifier
        )
        tv.register(
            MusicHeaderView.self,
            forHeaderFooterViewReuseIdentifier: MusicHeaderView.identifier
        )
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Musics"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        
        initUI()
        initConstraints()
        
        fetchData()
    }
}

// MARK: - private methods
private extension TableViewVC {
    
    func initUI() {
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    func fetchData() {
        
        dataFetcher.fetchData { [weak self] musics in
            self?.sections = []
            self?.sections = musics.sorted( by:{ $0.number < $1.number } )
            self?.tableView.refreshControl?.endRefreshing()
        }
    }
    
}

// MARK: - MusicHeaderModelDelegate
extension TableViewVC: MusicHeaderModelDelegate {
    func tappedHeader(with sectionNumber: Int) {

        self.sections[sectionNumber].collapse()
        self.tableView.reloadSections(IndexSet(integer: sectionNumber), with: .fade)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - MusicCellModelDelegate
extension TableViewVC: MusicCellModelDelegate {
    func voit(with title: String?) {
        self.showAlert(
            withTitle: "Ваш голос учтен!",
            withMessage: "Вы проголосовали за песню: \(title!)"
        )
    }
}
