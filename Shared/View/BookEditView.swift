//
//  BookEditView.swift
//  BookList
//
//  Created by Piotr Suwara on 3/9/20.
//

import SwiftUI

struct BookEditView: View {
    @StateObject var viewModel = BookViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Book")) {
                    TextField("Title", text: $viewModel.book.title)
                    TextField("Pages", value: $viewModel.book.numberOfPages, formatter: NumberFormatter())
                }
                Section(header: Text("Author")) {
                    TextField("Author", text: $viewModel.book.author)
                }
            }
            .navigationBarTitle("New Book", displayMode: .inline)
            .navigationBarItems(leading: Button(action:  {handleCancelTapped()}, label: {
                Text("Cancel")
            }), trailing: Button(action: {handleDoneTapped()}, label: {
                Text("Done")
            }))
        }
    }
    
    func handleCancelTapped() {
        dismissDialog()
    }
    
    func handleDoneTapped() {
        viewModel.save()
        dismissDialog()
    }
    
    func dismissDialog() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct BookEditView_Previews: PreviewProvider {
    static var previews: some View {
        BookEditView()
    }
}
