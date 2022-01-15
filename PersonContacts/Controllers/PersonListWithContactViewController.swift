//
//  PersonListWithContactViewController.swift
//  PersonContacts
//
//  Created by Андрей Евдокимов on 14.01.2022.
//

import UIKit

class PersonListWithContactViewController: UITableViewController {
    
    var persons: [Person]!

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personWithContactCell", for: indexPath)

        let rowIndex = indexPath.first
        let cellIndex = indexPath.last
        
        let person = persons[rowIndex ?? 0]
        var content = cell.defaultContentConfiguration()
        
        if cellIndex == 0 {
            content.text = person.phone
            content.image = UIImage(systemName: "phone")
        } else if cellIndex == 1 {
            content.text = person.email
            content.image = UIImage(systemName: "mail")
        }
        
        content.textProperties.font = UIFont.systemFont(ofSize: 20)

        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return persons[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.font = UIFont.systemFont(ofSize: 16)
    }
}
