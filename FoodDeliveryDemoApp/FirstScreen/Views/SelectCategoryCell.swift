//
//  SelectCategoryCell.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 23.06.2023.
//

import UIKit

class SelectCategoryCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                let selectedColor = UIColor(red: 0.95, green: 0.23, blue: 0.41, alpha: 0.4)
                self.contentView.backgroundColor = selectedColor
                self.label.font = .systemFont(ofSize: 13, weight: .bold)
                self.label.textColor = UIColor(red: 0.95, green: 0.23, blue: 0.41, alpha: 1)
            } else {
                let selectedColor = UIColor(red: 0.95, green: 0.23, blue: 0.41, alpha: 0.4)
                self.contentView.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.98, alpha: 1)
                self.label.font = .systemFont(ofSize: 13, weight: .regular)
                self.label.textColor = selectedColor
            }
        }
    }
    
  
    var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 0.4)
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .center
        label.toAutoLayout()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
       
        contentView.addSubviews(label)
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 0.4).cgColor
        self.layer.borderWidth = 1

        let constrains = [
           
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}

