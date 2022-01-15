//
//  Person.swift
//  PersonContacts
//
//  Created by Андрей Евдокимов on 14.01.2022.
//

struct Person {
    let name: String
    let surname: String
    let phone: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func generatePersons(names: [String], surnames: [String], phones: [String], emails: [String]) -> [Person] {
        var persons: [Person] = []

        let randomNames = names.shuffled()
        let randomSurnames = surnames.shuffled()
        let randomPhones = phones.shuffled()
        let randomEmails = emails.shuffled()
        
        for index in 0...randomNames.count - 1 {
            let person = Person(
                name: randomNames[index],
                surname: randomSurnames[index],
                phone: randomPhones[index],
                email: randomEmails[index]
            )
            
            persons.append(person)
        }
        
        return persons
    }
}
