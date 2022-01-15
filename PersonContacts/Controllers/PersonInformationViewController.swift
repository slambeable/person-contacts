//
//  PersonInformationViewController.swift
//  PersonContacts
//
//  Created by Андрей Евдокимов on 14.01.2022.
//

import UIKit

class PersonInformationViewController: UIViewController {
    
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = person.fullName

        phoneLabel.text = person.phone
        emailLabel.text = person.email
    }

}
