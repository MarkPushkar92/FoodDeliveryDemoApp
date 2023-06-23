//
//  MenuHeader.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 23.06.2023.
//

import UIKit

class MenuHeaderView: UITableViewHeaderFooterView {
    
    var onTap: ((String) -> ())?
        
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    private let layout = UICollectionViewFlowLayout()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
 
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        
        backgroundView?.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.98, alpha: 1)
        addSubview(collectionView)
    
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor)

           ]

        NSLayoutConstraint.activate(constraints)
        
        layout.scrollDirection = .horizontal
        collectionView.alwaysBounceHorizontal = true
        collectionView.toAutoLayout()
        collectionView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        collectionView.register(SelectCategoryCell.self, forCellWithReuseIdentifier: String(describing: SelectCategoryCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = false
        
    }
    
}


 
extension MenuHeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Category.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SelectCategoryCell.self), for: indexPath) as! SelectCategoryCell
        

        
        
        cell.label.text = Category.allCases[indexPath.row].rawValue.capitalized
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     //   let selectedColor = UIColor(red: 0.95, green: 0.23, blue: 0.41, alpha: 0.4)
        let selectedCell: SelectCategoryCell = collectionView.cellForItem(at: indexPath)! as! SelectCategoryCell
//        selectedCell.contentView.backgroundColor = selectedColor
//        selectedCell.label.font = .systemFont(ofSize: 13, weight: .bold)
//        selectedCell.label.textColor = UIColor(red: 0.95, green: 0.23, blue: 0.41, alpha: 1)
        guard let onTap = onTap else { return }
        onTap(selectedCell.label.text ?? "")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let selectedColor = UIColor(red: 0.95, green: 0.23, blue: 0.41, alpha: 0.4)
//        let selectedCell: SelectCategoryCell = collectionView.cellForItem(at: indexPath)! as! SelectCategoryCell
//        selectedCell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.98, alpha: 1)
//        selectedCell.label.font = .systemFont(ofSize: 13, weight: .regular)
//        selectedCell.label.textColor = selectedColor
    }
}

extension MenuHeaderView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 88
        let height: CGFloat = 32
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 8, bottom: 24, right: 8)
    }
}


