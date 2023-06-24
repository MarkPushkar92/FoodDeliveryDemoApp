//
//  FirstScreenView.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import UIKit


class FirstScreenView: UIView {
        
    private let header = MenuHeaderView()

    var menu = [MenuObject]() {
        didSet {
            tableView.reloadData()
        }
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuCell.self, forCellReuseIdentifier: cellID)
        tableView.register(PromoCollectionContainer.self, forCellReuseIdentifier: String(describing: PromoCollectionContainer.self))
        return tableView
    }()

    private let cellID = "cellID"

    private func setupViews() {
        self.toAutoLayout()
        self.backgroundColor = .white
        self.addSubview(tableView)
        let constraints = [
                        
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

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



//MARK: EXTENSIONS

extension FirstScreenView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return menu.count
        }
        

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PromoCollectionContainer.self), for: indexPath) as! PromoCollectionContainer
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MenuCell

            let object = menu[indexPath.row]

            cell.category = object.category
            cell.titleLabel.text = object.name
            cell.decriptionLabel.text = object.dsc
            if let price = object.price {
                cell.priceLabel.text = "от \(Int(price)) р"
            }
            if let url = URL(string: object.img ?? "") {

                cell.image.load(url: url)
            }
            return cell
        }
        

    }

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            let index: Int

            if indexPath.row < menu.count - 1{
                index = indexPath.row + 1
            } else if indexPath.row == menu.count {
                index = indexPath.row
            } else {
                index = indexPath.row - 1
            }

            let currentCatInDispalyedCell = menu[index].category


            let selectedCategoryCell = header.collectionView.visibleCells.first(where: { $0.isSelected }) as? SelectCategoryCell
            let currentSelectedCategory = selectedCategoryCell?.label.text?.lowercased()

            if currentCatInDispalyedCell?.rawValue != currentSelectedCategory {
                deselectAllCategories()
                guard let categotyToSelectIndex = Category.allCases.firstIndex(where: { $0 == currentCatInDispalyedCell }) else { return }
                header.collectionView.cellForItem(at: IndexPath(item: categotyToSelectIndex, section: 0))?.isSelected = true
            }

        }
     
    }
    
    func deselectAllCategories() {
        for index in 0...Category.allCases.count - 1 {
            let indexPath = IndexPath(item: index, section: 0)
            header.collectionView.cellForItem(at: indexPath)?.isSelected = false
        }
    }
    

    //MARK: EXTENSIONS TABLEVIEW DATA SOURCE (HEADER)

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            header.onTap = { [self] category in
                deselectAllCategories()
                if let index = self.menu.firstIndex(where: { $0.category?.rawValue == category.lowercased()}) {
                    let indexPath = IndexPath(row: index, section: 1)
                    tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                }
            }
            
            header.collectionView.cellForItem(at: IndexPath(item: 0, section: 0))?.isSelected = true
            return header
        } else {
            return nil
        }
       
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 80
        } else {
            return 0
        }
        
    }

}

extension FirstScreenView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 112
        } else {
            return 180
        }
    }


}

