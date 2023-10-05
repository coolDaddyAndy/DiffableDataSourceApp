//
//  PaymentTableViewCell.swift
//  DiffableDataSourceApp
//
//  Created by Andrei Sushkou on 3.10.23.
//

import UIKit

final class PaymentTableViewCell: UITableViewCell {
    
    static let cellID: String = "PaymentTableViewCell"
    
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
    }
    
    func configure(_ model: PaymentModel) {
        iconImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
    }
}

//MARK: - Set constraints

extension PaymentTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leftAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            iconImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
