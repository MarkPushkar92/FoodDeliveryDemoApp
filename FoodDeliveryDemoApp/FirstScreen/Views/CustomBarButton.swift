//
//  CustomBarButton.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 24.06.2023.
//

import UIKit


class CustomBarButton: UIView {
        
    private let label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Москва"
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.image = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return image
    }()

    private func setupViews() {
        self.toAutoLayout()
        self.backgroundColor = .white
        self.addSubviews(image, label)
        let constraints = [
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 5),
        ]
        NSLayoutConstraint.activate(constraints)


    }

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



