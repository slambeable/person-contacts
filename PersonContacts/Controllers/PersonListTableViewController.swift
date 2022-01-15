//
//  PersonListTableViewController.swift
//  PersonContacts
//
//  Created by Андрей Евдокимов on 14.01.2022.
//

import UIKit

class PersonListTableViewController: UITableViewController {
    
    private let persons = Person.generatePersons(
        names: DataManager.getNames(),
        surnames: DataManager.getSurnames(),
        phones: DataManager.getPhoneNumbers(),
        emails: DataManager.getEmail()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPropertyForPersonWithContactVC()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = persons[indexPath.row]
        
        let fontWeight = UIFont.Weight.semibold
        
        content.text = person.fullName
        content.textProperties.font = UIFont.systemFont(ofSize: 20, weight: fontWeight)

        cell.contentConfiguration = content
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? PersonInformationViewController else { return }
        guard let indexOfCell = tableView.indexPathForSelectedRow?.row else { return }

        tabBarController.person = persons[indexOfCell]
    }
    
    // MARK: - Set property for another controllers
    private func setPropertyForPersonWithContactVC() {
        guard let viewControllers = tabBarController?.viewControllers else { return }

        for viewController in viewControllers {
            if let personWithContactVC = viewController as? PersonListWithContactViewController {
                personWithContactVC.persons = persons
            }
        }
    }

}
