//
//  LocationsViewModel.swift
//  Map App
//
//  Created by Vinicius on 5/26/25.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
