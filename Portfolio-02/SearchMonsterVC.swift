//
//  SearchMonsterVC.swift
//  Portfolio-02
//
//  Created by champ on 09/03/17.
//  Copyright © 2017 champ. All rights reserved.
//

import UIKit

class SearchMonsterVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    
    @IBOutlet weak var monsterCountLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var monsters = [Monster]()
    var filteredMonsters = [Monster]()
    let searchController = UISearchController(searchResultsController: nil) //we will display the search results in the same view as table view therefore we will not be needing the searchResultsController
    
    func filterContentForSearchText(searchText: String, scope: String="All"){
        filteredMonsters = monsters.filter{
            //Check ! unwrapping here could be a source of error
            monster in
            return monster.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    

    // its a required function for UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
            let m1 = Monster(name: "Bulbasaur",age: 12,species: "plant",power: 100,health: 500)
            let m2 = Monster(name: "Squirtle",age: 9,species: "water",power: 120,health: 450)
            let m3 = Monster(name: "Charmander",age: 8,species: "fire",power: 150,health: 600)
            let m4 = Monster(name: "Pikachu",age: 9,species: "electric",power: 140,health: 700)
            let m5 = Monster(name: "Mew",age: 5,species: "unique",power: 200,health: 1000)
            monsters.append(m1)
            monsters.append(m2)
            monsters.append(m3)
            monsters.append(m4)
            monsters.append(m5)
        
        
            
            searchController.searchResultsUpdater = self //informs searchController when text changes within UI text bar
            searchController.hidesNavigationBarDuringPresentation = false
            definesPresentationContext = true
            searchController.dimsBackgroundDuringPresentation = false
            searchController.searchBar.sizeToFit()
            tableView.tableHeaderView = searchController.searchBar
            tableView.delegate = self
            tableView.dataSource = self
        }
    
    
    //required functions for table view
    // get data for reusable cells and return the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MonsterCell", for:indexPath) as? MonsterCell {
        //Table view returns reusable cells checks whether to display filtered or unfiltered data
            if searchController.isActive && searchController.searchBar.text != ""{
            let monsterElement = filteredMonsters[indexPath.row]
                cell.updateUI(monsterElement: monsterElement)
                return cell
            }
            else{
                let monsterElement = monsters[indexPath.row]
                cell.updateUI(monsterElement: monsterElement)
                return cell
            }
            
        }
        else{
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // check if user is searching or not and use the correct data source
        if searchController.isActive && searchController.searchBar.text != ""{
            monsterCountLbl.text = String(filteredMonsters.count)
            return filteredMonsters.count
            
        }
        monsterCountLbl.text = String(monsters.count)
        return monsters.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let monsterElement = monsters[indexPath.row]
        performSegue(withIdentifier: "ViewMonsterVC", sender: monsterElement)
        
    }
    //   New updated perform for segue , but the segue needs to be sent based on the updated data(Table is updated after search)
    // The updated table has a different index to the initial index. The segue needs to reflect that
    // Send data to the View Monster View controller via segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewMonsterVC"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let monsterDetail : Monster
                if searchController.isActive  && searchController.searchBar.text != "" {
                    monsterDetail = filteredMonsters[indexPath.row]
                }
                else{
                    monsterDetail = monsters[indexPath.row]
                }
                if let destination = segue.destination as? ViewMonsterVC {
                                //if let monsterElement = sender as? Monster{
                                    destination.monster = monsterDetail
                                //}
                            }

            }
        }
    }

//   we did this previously , but the segue needs to sent in the updated (Table is updated after search)
    // The updated table has a different index to the initial index. The segue needs to reflect that
//    // Send data to the View Monster View controller via segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? ViewMonsterVC {
//            if let monsterElement = sender as? Monster{
//                destination.monster = monsterElement
//            }
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
