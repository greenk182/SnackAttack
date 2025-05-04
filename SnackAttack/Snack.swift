//
//  Snack.swift
//  SnackAttack
//
//  Created by Kevin Green on 5/4/25.
//

import Foundation

struct Snack: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    var count: Int = 0
}

struct MockData {
    static let sampleSnack = Snack(id: "0001",
                                   name: "Sample Snack",
                                   description: "This is a description for a sample snack",
                                   price: 9.99,
                                   imageURL: "")
    
    static let snacks = [sampleSnack, sampleSnack, sampleSnack, sampleSnack]
}
