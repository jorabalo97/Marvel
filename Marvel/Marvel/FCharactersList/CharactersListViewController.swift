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
    
    var FiltredCharacters: [String]!
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Definir delegados de SearchBar
        SearchBar.delegate=self
        
        //Definir los delegados de la tabla
        TableView.delegate=self
        TableView.dataSource=self
        
        FiltredCharacters = Characters
        
        
        
        
    }
}
      //Metodos SearchBar
extension CharactersListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        FiltredCharacters = []
        
        if searchText == "" {
            FiltredCharacters = Characters
        }else{
            for Character in Characters{
                if Character.lowercased().contains(searchText.lowercased()) {
                    FiltredCharacters.append(Character)
                }
            }
            
            
        }
        self.TableView.reloadData()
    }
}
    extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource {
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return FiltredCharacters.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
            celda.textLabel?.text = FiltredCharacters[indexPath.row]
            return celda
            
        }
        
        
    }
    

