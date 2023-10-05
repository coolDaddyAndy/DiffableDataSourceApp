//
//  SubscribeTableViewCell.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 3.10.23.
//

import UIKit

final class SubscribeTableViewCell: UITableViewCell {
    
    static let cellID: String = "ProductTableViewCell"
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
    }
    
    func configure(_ model: SubscribeModel) {
        iconImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        descriptionLabel.text = model.description
    }
}

//MARK: - Set constraints

extension SubscribeTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leftAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            iconImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
