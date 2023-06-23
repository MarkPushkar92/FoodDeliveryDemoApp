//
//  FirstScreenView.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import UIKit


class FirstScreenView: UIView {
    
    let header = MenuHeaderView()

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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return menu.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

   
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
      
            
            
            
            

        
    }


    //MARK: EXTENSIONS TABLEVIEW DATA SOURCE (HEADER)

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header.onTap = { category in
            if let index = self.menu.firstIndex(where: { $0.category?.rawValue == category.lowercased()}) {
                let indexPath = IndexPath(row: index, section: 0)
                tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }

}

extension FirstScreenView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 180
    }


}

/*
 private func applyData() {
     DispatchQueue.main.async {
         if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? LatestTableCell {
            cell.collectionView.reloadData()
         }
         if let cell1 = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? FlashSaleTableCell {
            cell1.collectionView.reloadData()
         }
         if let cell = self.tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? LatestTableCell {
            cell.collectionView.reloadData()
         }
         self.tableView.reloadData()
     }
 }
 */
