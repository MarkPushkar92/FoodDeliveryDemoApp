//
//  MenuCell.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import UIKit

class MenuCell: UITableViewCell {
    
    
    let image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.backgroundColor = .red
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.toAutoLayout()
        return label
    }()
    
    let decriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Decription"
        label.toAutoLayout()
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "от 340 р"
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.layer.borderColor = UIColor.red.cgColor
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
            
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 132),
            image.heightAnchor.constraint(equalToConstant: 132),
            
            titleLabel.topAnchor.constraint(equalTo: image.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 32),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
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

