//
//  CharactersListViewController.swift
//  Marvel
//
//  Created by Jorge Abalo Dieste on 4/12/23.
//

import Foundation
import UIKit

class CharactersListViewController: UIViewController {
    
    let Characters = ["Iron-Man","Capitan America","Hulk","Thor","Black Widow","Vision","Wanda","Spider-man","Ojo de Halcon","Venom","Loki","Capitana Marvel","Groot","Star Lord","Gamora","Rocket","Drax","Wolverine","Ms.Marvel"]
    
    var filteredCharacters: [String]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        filteredCharacters = Characters
    }
}

extension CharactersListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCharacters = []
        if searchText == "" {
            filteredCharacters = Characters
        }else{
            for character in Characters {
                if character.lowercased().contains(searchText.lowercased()) {
                    filteredCharacters.append(character)
                }
            }
        }
        self.tableView.reloadData()
    }
}

extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = filteredCharacters[indexPath.row]
        return cell
    }
    }

