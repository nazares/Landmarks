//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Sergei Nazarenko on 19.09.2021.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
