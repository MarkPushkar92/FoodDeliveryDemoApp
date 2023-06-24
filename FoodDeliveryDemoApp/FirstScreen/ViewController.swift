//
//  ViewController.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    weak var coordinator: FirstScreenCoordinator?
    
    private let viewModel: FirtsScreenViewModel
    
    private var mainView = FirstScreenView()
    
    
    //MARK: Init and LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.fetchMenu()
        viewModel.reloader =  { [self] in
            mainView.menu = viewModel.menu.sorted(by: { $0.category! < $1.category! })
            mainView.tableView.reloadData()
        }
      
    }
        
  

    init(viewModel: FirtsScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ViewController {
    
     func setupViews() {
         navigationItem.leftBarButtonItem = UIBarButtonItem(customView: CustomBarButton())

         view.backgroundColor = .white
         view.addSubview(mainView)
         
         let constrains = [
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
         ]
         NSLayoutConstraint.activate(constrains)
    }
}
