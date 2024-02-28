//
//  PicStreamApp.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

@main
struct PicStreamApp: App {
    
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                WelcomeView()
                    .preferredColorScheme(.light)
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .login:
                            LoginView()
                                .environmentObject(router)
                        case .register:
                            RegistrationView()
                                .environmentObject(router)
                        case .mainPage:
                            MainPageView().environmentObject(router)
                        case .detailPage(let imageModel):
                            DetailPageView(image: imageModel)
                        }
                    }
                
            }
            .environmentObject(router)
        }
    }
}
