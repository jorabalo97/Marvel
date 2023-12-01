//
//  ItemsListViewModel.swift
//  Marvel
//
//  Created by Cristina Amoedo Fragueiro on 28/11/23.
//

import Foundation
 
class ItemsListViewModel {
    var view: ItemsListViewController
    
    private let itemsListCoordinator: ItemsListCoordinator

    init(itemsListCoordinator: ItemsListCoordinator,
         view: ItemsListViewController) {
        self.itemsListCoordinator = itemsListCoordinator
        self.view = view
        
    }
}
