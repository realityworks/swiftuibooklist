//
//  BooksListView.swift
//  BookList (iOS)
//
//  Created by Piotr Suwara on 31/8/20.
//

import SwiftUI

struct BooksListView: View {
    @ObservedObject var viewModel = BooksViewModel()
    
    @State private var presentAddNewBookScreen = false
    
    var body: some View {
        NavigationView {
            List(viewModel.books) { book in
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
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { presentAddNewBookScreen.toggle() }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $presentAddNewBookScreen) {
                BookEditView()
            }
            .onAppear() {
                viewModel.subscribe()
            }
            .onDisappear() {
                viewModel.unsubscribe()
            }
        }
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView()
    }
}
