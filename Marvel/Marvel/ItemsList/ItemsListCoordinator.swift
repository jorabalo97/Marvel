//
//  ItemsListCoordinator.swift
//  Marvel
//
//  Created by Cristina Amoedo Fragueiro on 28/11/23.
//

import UIKit

class ItemsListCoordinator {
    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start(){
        navigationController?.pushViewController(build(), animated: true)
    }
    
    func build() -> UIViewController {
        let itemsListViewController = ItemsListViewController()
        let itemsListViewModel = ItemsListViewModel(itemsListCoordinator: self, view: itemsListViewController)
        itemsListViewController.viewModel = itemsListViewModel
        
        return itemsListViewController
    }
}
