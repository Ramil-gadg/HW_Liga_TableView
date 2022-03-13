//
//  MusicCell.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 12.03.2022.
//

import UIKit

final class MusicCell: UITableViewCell {
    
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        return view
    }()
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    private lazy var ratingLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Рейтинг:"
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.numberOfLines = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    private lazy var ratingStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var voitButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .cyan
        btn.setImage(UIImage(named: "icon_voit"), for: .normal)
        btn.backgroundColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    private var model: MusicCellModel?
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
        initUI()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        self.selectionStyle = .none
        contentView.addSubview(shadowView)
        shadowView.addSubview(view)
        view.addSubviews(image, title, ratingLbl, ratingStack, voitButton)
        
        voitButton.addTarget(
            self,
            action: #selector(voitTapped),
            for: .touchUpInside
        )
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            view.topAnchor.constraint(equalTo: shadowView.topAnchor),
            view.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 60),
            image.widthAnchor.constraint(equalToConstant: 60),
            
            voitButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            voitButton.centerXAnchor.constraint(equalTo: image.centerXAnchor),
            voitButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20),
            
            title.topAnchor.constraint(equalTo: image.topAnchor),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            ratingLbl.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            ratingLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            ratingLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            ratingStack.topAnchor.constraint(equalTo: ratingLbl.bottomAnchor, constant: 10),
            ratingStack.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            ratingStack.heightAnchor.constraint(equalToConstant: 33),
            ratingStack.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with model: MusicCellModel) {
        self.model = model
        
        self.title.text = model.title
        self.image.image = model.image
        self.confiureRating(with: model.rating)
    }
    
    private func confiureRating(with rating: Int) {
        ratingStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for _ in 1...rating {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "icon_star")
            ratingStack.addArrangedSubview(imageView)
        }
    }
    
    @objc
    func voitTapped() {
        model?.delegate?.voit(with: model?.title)
    }
}
