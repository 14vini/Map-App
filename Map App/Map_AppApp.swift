//
//  Map_AppApp.swift
//  Map App
//
//  Created by Vinicius on 5/25/25.
//

import SwiftUI

@main
struct Map_AppApp: App {

    @ObservedObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
