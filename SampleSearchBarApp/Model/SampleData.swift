//
//  SampleData.swift
//  SampleSearchBarApp
//
//  Created by Softsuave on 24/06/24.
//

import Foundation


struct Person: Equatable, Hashable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.name == rhs.name &&
        lhs.first_name == rhs.first_name &&
        lhs.last_name == rhs.last_name &&
        lhs.phone_number == rhs.phone_number &&
        lhs.banks == rhs.banks
    }
    
    var name: String
    var first_name: String
    var last_name: String
    var phone_number: Int
    var banks: [Banks]
    
    init(name: String, first_name: String, last_name: String, phone_number: Int, banks: [Banks]) {
        self.name = name
        self.first_name = first_name
        self.last_name = last_name
        self.phone_number = phone_number
        self.banks = banks
    }
}

struct Banks: Equatable, Hashable {
    var name: String
    var cards: [CreditCard]
    
    init(name: String, cards: [CreditCard]) {
        self.name = name
        self.cards = cards
    }
}

struct CreditCard: Equatable, Hashable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// Dummy data for credit cards
let cards = ["Visa", "Mastercard", "American Express", "Discover"]
let card1 = CreditCard(name: "Visa")
let card2 = CreditCard(name: "Mastercard")
let card3 = CreditCard(name: "American Express")
let card4 = CreditCard(name: "Discover")

// Dummy data for banks with associated credit cards
let banks = ["Bank of America", "Chase Bank", "Wells Fargo", "Citibank"]
let bank1 = Banks(name: "Bank of America", cards: [card1, card2])
let bank2 = Banks(name: "Chase Bank", cards: [card3])
let bank3 = Banks(name: "Wells Fargo", cards: [card2, card4])
let bank4 = Banks(name: "Citibank", cards: [card1, card3])

// Dummy data for persons with associated banks and credit cards
let persons: [Person] = [
    Person(name: "John Doe", first_name: "John", last_name: "Doe", phone_number: 1234567890, banks: [bank1, bank2]),
    Person(name: "Jane Smith", first_name: "Jane", last_name: "Smith", phone_number: 9876543210, banks: [bank3]),
    Person(name: "Michael Johnson", first_name: "Michael", last_name: "Johnson", phone_number: 5678901234, banks: [bank1, bank4]),
    Person(name: "Emily Brown", first_name: "Emily", last_name: "Brown", phone_number: 2345678901, banks: [bank2, bank3]),
    Person(name: "Robert Wilson", first_name: "Robert", last_name: "Wilson", phone_number: 8901234567, banks: [bank4]),
    Person(name: "David Lee", first_name: "David", last_name: "Lee", phone_number: 4567890123, banks: [bank1]),
    Person(name: "Sarah Taylor", first_name: "Sarah", last_name: "Taylor", phone_number: 9012345678, banks: [bank2]),
    Person(name: "James Martinez", first_name: "James", last_name: "Martinez", phone_number: 3456789012, banks: [bank3, bank4]),
    Person(name: "Jennifer Davis", first_name: "Jennifer", last_name: "Davis", phone_number: 6789012345, banks: [bank1, bank2, bank3]),
    Person(name: "Daniel Anderson", first_name: "Daniel", last_name: "Anderson", phone_number: 1234509876, banks: [bank4]),
    Person(name: "Laura Thomas", first_name: "Laura", last_name: "Thomas", phone_number: 8901234501, banks: [bank1, bank2]),
    Person(name: "Matthew Clark", first_name: "Matthew", last_name: "Clark", phone_number: 2345678901, banks: [bank3, bank4]),
    Person(name: "Jessica Lewis", first_name: "Jessica", last_name: "Lewis", phone_number: 6789012345, banks: [bank1]),
    Person(name: "Christopher Walker", first_name: "Christopher", last_name: "Walker", phone_number: 4567890123, banks: [bank2]),
    Person(name: "Megan Hall", first_name: "Megan", last_name: "Hall", phone_number: 9012345678, banks: [bank3]),
    Person(name: "Ryan Young", first_name: "Ryan", last_name: "Young", phone_number: 1234509876, banks: [bank4]),
    Person(name: "Amanda Allen", first_name: "Amanda", last_name: "Allen", phone_number: 8901234501, banks: [bank1, bank2]),
    Person(name: "Kevin King", first_name: "Kevin", last_name: "King", phone_number: 2345678901, banks: [bank3]),
    Person(name: "Hannah Green", first_name: "Hannah", last_name: "Green", phone_number: 6789012345, banks: [bank4]),
    Person(name: "Brandon Baker", first_name: "Brandon", last_name: "Baker", phone_number: 4567890123, banks: [bank1, bank2, bank3, bank4])
]
