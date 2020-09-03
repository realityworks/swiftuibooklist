//
//  BooksViewModel.swift
//  BookList
//
//  Created by Piotr Suwara on 3/9/20.
//

import Foundation
import FirebaseFirestore

class BooksViewModel: ObservableObject {
    @Published var books = [Book]()
    
    private var db = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    
    deinit {
        unsubscribe()
    }
    
    func unsubscribe() {
        if listenerRegistration != nil {
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }
    
    func subscribe() {
        if listenerRegistration == nil {
            listenerRegistration = db.collection("books").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.books = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: Book.self)
                }
            }
        }
    }
}
