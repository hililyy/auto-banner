//
//  MainTableVC.swift
//  AutoBanner
//
//  Created by 강조은 on 2023/11/17.
//

import UIKit

class MainTableVC: UITableViewController {
    let data = ["첫 번째", "두 번째", "세 번째", "네 번째"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)

        cell.textLabel?.text = data[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let vc = OneVC()
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        default:
            break
        }
    }
    
}
