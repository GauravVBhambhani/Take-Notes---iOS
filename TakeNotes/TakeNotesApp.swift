//
//  TakeNotesApp.swift
//  TakeNotes
//
//  Created by Gaurav Bhambhani on 10/30/24.
//

import Amplify
import AWSCognitoAuthPlugin
import SwiftUI

@main
struct TakeNotesApp: App {
    
    init() {
            do {
                try Amplify.add(plugin: AWSCognitoAuthPlugin())
                try Amplify.configure()
                print("Initialized Amplify");
            } catch {
                print("Could not initialize Amplify: \(error)")
            }
        }
    
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(AuthenticationService())
        }
    }
}
