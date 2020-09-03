//
//  BookViewModel.swift
//  BookList
//
//  Created by Piotr Suwara on 3/9/20.
//

import Foundation
import Firebase

class BookViewModel: ObservableObject {
    @Published var book: Book =  Book(title: "", author: "", numberOfPages: 0)
    private var db = Firestore.firestore()
    
    func addBook(book: Book) {
        do {
            let _ = try db.collection("books").addDocument(from: book)
        } catch {
            print ("Error: \(error)")
        }
    }
    
    func save() {
        addBook(book: book)
    }
}
