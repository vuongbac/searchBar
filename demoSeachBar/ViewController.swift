//
//  ViewController.swift
//  demoSeachBar
//
//  Created by BAC Vuong Toan (VTI.Intern) on 12/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tbv: UITableView!
    var data = ["a","b","c"]
    let search = UISearchController(searchResultsController: nil)
    var data2 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbv.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        tbv.tableHeaderView = search.searchBar

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbv.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setUpData(data: data2[indexPath.row])
        return cell
    }
}
extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == "" {
            data2 = data
        } else {
            data2 = data.filter { $0.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        self.tbv.reloadData()
    }
    
    
}


