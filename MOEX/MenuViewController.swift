//
//  MenuViewController.swift
//  MOEX
//
//  Created by Артем Пивнев on 26.09.2021.
//

import UIKit

enum MenuType: Int {
    case profile
    case cots
    case obotots
    case info
    case settings
    case news

}
class MenuViewController: UITableViewController {

    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }
    
}
