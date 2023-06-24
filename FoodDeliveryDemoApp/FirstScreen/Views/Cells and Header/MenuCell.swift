//
//  MenuCell.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import UIKit

class MenuCell: UITableViewCell {
    
    var category: Category?
    
    let image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 132/2
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.toAutoLayout()
        return label
    }()
    
    let decriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Decription"
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .lightGray
        label.toAutoLayout()
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "от 340 р"
        label.font = .systemFont(ofSize: 13)
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.layer.borderColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1).cgColor
        label.textColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1)
        label.textAlignment = .center
        label.toAutoLayout()
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        self.addSubviews(titleLabel, decriptionLabel, image, priceLabel)
        let constraints = [
            
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 132),
            image.heightAnchor.constraint(equalToConstant: 132),
            
            titleLabel.topAnchor.constraint(equalTo: image.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 32),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 171),

            
            decriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            decriptionLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 32),
            decriptionLabel.widthAnchor.constraint(equalToConstant: 171),
            
            priceLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -64),
            priceLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 116),
            priceLabel.widthAnchor.constraint(equalToConstant: 87),
            priceLabel.heightAnchor.constraint(equalToConstant: 32)
            
        ]
        NSLayoutConstraint.activate(constraints)

        
    }

}

