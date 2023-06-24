//
//  PromoCollectionContainer.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 24.06.2023.
//



import UIKit


class PromoCollectionContainer: UITableViewCell {
    
    private let photoOneUrl = "https://goldbelly.imgix.net/uploads/showcase_media_asset/image/137148/Gramercy-Tavern-Burger-and-Kielbasa-Kit-6.4.21-72ppi-1x1-15.jpg?ixlib=react-9.0.2&auto=format&ar=1%3A1"
    
    private let photoTwoUrl = "https://goldbelly.imgix.net/uploads/showcase_media_asset/image/134862/shake-shack-shackburger-8-pack.973a5e26836ea86d7e86a327becea2b0.png?ixlib=react-9.0.2&auto=format&ar=1%3A1"
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    private let layout = UICollectionViewFlowLayout()
    
    private func setupViews() {
                
        backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.98, alpha: 1)
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
        collectionView.register(PromoCell.self, forCellWithReuseIdentifier: String(describing: PromoCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
    
        
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

 
}



//MARK: EXTENSIONS

extension PromoCollectionContainer: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PromoCell.self), for: indexPath) as! PromoCell
        
        if indexPath.row == 0 {
            guard let url = URL(string: photoOneUrl) else { return cell }
            cell.image.load(url: url)
        } else {
            guard let url = URL(string: photoTwoUrl) else { return cell }
            cell.image.load(url: url)
        }
        return cell
    }
    
  
}

extension PromoCollectionContainer: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 300
        let height: CGFloat = 112
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}


extension UITableViewCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
