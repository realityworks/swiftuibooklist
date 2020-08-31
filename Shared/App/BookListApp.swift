//
//  BookListApp.swift
//  Shared
//
//  Created by Piotr Suwara on 31/8/20.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct BookListApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
