//
//  RouteManager.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case register
        case login
        case mainPage
        case detailPage(ImageModel)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
