//
//  BooksListView.swift
//  BookList (iOS)
//
//  Created by Piotr Suwara on 31/8/20.
//

import SwiftUI

struct BooksListView: View {
    var books = testData
    
    var body: some View {
        NavigationView {
            List(books) { book in
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text(book.author)
                        .font(.subheadline)
                    Text("\(book.numberOfPages) pages")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Books")
        }
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView()
    }
}
