//
//  Book.swift
//  BookList (iOS)
//
//  Created by Piotr Suwara on 31/8/20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Book: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var author: String
    var numberOfPages: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case numberOfPages// = "pages"
    }
}

let testData = [
  Book(title: "The Ultimate Hitchhiker's Guide to the Galaxy: Five Novels in One Outrageous Volume", author: "Douglas Adams", numberOfPages: 815),
  Book(title: "Changer", author: "Matt Gemmell", numberOfPages: 474),
  Book(title: "Toll", author: "Matt Gemmell", numberOfPages: 474)
]
