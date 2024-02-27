//
//  PicStreamApp.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

@main
struct PicStreamApp: App {
    @StateObject private var navigationPathManager = NavigationPathManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationPathManager.path) {
                WelcomeView()
            }
            .environmentObject(navigationPathManager)
        }
    }
}
