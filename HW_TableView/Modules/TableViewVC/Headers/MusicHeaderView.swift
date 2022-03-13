//
//  MusicHeaderView.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 12.03.2022.
//

import UIKit


final class MusicHeaderView: UITableViewHeaderFooterView {
    
    static var identifier: String {
        String(describing: MusicHeaderView.self)
    }
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var greyView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lbl.numberOfLines = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private var model: MusicHeaderModel?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        initUI()
        initConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        addSubview(view)
        view.addSubviews(title, greyView, image)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped))
        view.addGestureRecognizer(gesture)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -16),
            title.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            image.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -8),
            image.widthAnchor.constraint(equalToConstant: 24),

            greyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            greyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            greyView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configure(with model: MusicHeaderModel) {
        self.model = model
        self.title.text = model.header
        self.image.image = model.image
    }
    
    @objc
    func headerTapped() {
        
        guard let model = model else { return }
        model.delegate?.tappedHeader(
            with: model.sectionNumber
        )
    }
}
