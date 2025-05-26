//
//  LocationsView.swift
//  Map App
//
//  Created by Vinicius on 5/24/25.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations){
                Text($0.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
