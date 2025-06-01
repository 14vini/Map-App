//
//  LocationPreviewView.swift
//  Map App
//
//  Created by Vinicius on 6/1/25.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    
    var body: some View {
        Text(location.name)
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
}
