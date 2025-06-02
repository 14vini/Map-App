//
//  Location.swift
//  Map App
//
//  Created by Vinicius on 5/26/25.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable{
    let name: String
    let country: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // Identifiable
      var id: String {
          // name = "Colosseum"
          // cityName = "Rome"
          // id = "ColosseumRome"
          name + cityName
      }
      
      // Equatable
      static func == (lhs: Location, rhs: Location) -> Bool {
          lhs.id == rhs.id
      }
  }
