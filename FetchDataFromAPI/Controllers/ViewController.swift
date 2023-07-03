//
//  ViewController.swift
//  FetchDataFromAPI
//
//  Created by Rohit Kumar on 7/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    func getData() {
        NetworkManager.shared.getDataFromApi { data in
            self.list = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else { return UITableViewCell() }
        cell.configureData(data: list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

