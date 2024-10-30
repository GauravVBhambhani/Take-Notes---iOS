//
//  TakeNotesApp.swift
//  TakeNotes
//
//  Created by Gaurav Bhambhani on 10/30/24.
//

import Amplify
import SwiftUI

@main
struct TakeNotesApp: App {
    
    init() {
        do {
            try Amplify.configure()
            print("Initialized Amplify");
        } catch {
            print("Could not initialize Amplify: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NotesView()
        }
    }
}
