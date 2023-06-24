//
//  PromoCell.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 24.06.2023.
//

import UIKit

class PromoCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
       
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        contentView.addSubviews(image)

        let constrains = [
            
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor)


        ]
        NSLayoutConstraint.activate(constrains)
    }
}

