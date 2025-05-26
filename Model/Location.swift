//
//  Location.swift
//  Map App
//
//  Created by Vinicius on 5/26/25.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        
        // name = Rome
        // cityName = Colosseum
        // id = RomeColosseum
        
        cityName + name
    }
}
