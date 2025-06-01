//
//  LocationsView.swift
//  Map App
//
//  Created by Vinicius on 5/24/25.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let maxWidthForIpad: CGFloat = 700
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                
                Image(systemName: "arrow.down.circle")
                    .font(.title2)
                    .foregroundColor(.primary.opacity(0.9))
                    .padding()
                    .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))

                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(.primary.opacity(0.9))
                    .frame(height: 40)
                    .animation(.none, value: vm.mapLocation)
                    .padding(.horizontal)
            }
            
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial.opacity(0.95))
        .cornerRadius(40)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.primary.opacity(0.2), lineWidth: 0.5)
        )
    }
}

#Preview {
    LocationsView()
}
