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
            MapLayer
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                locationsPreviewStack
            }
            .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
                LocationDetailView(location: location)
            }.cornerRadius(30)
        }
    }
}

extension LocationsView {
    
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                
                Image(systemName: "arrow.down.circle.fill")
                    .font(.title3)
                    .foregroundColor(.primary.opacity(0.8))
                    .padding(10)
                    .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))

                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary.opacity(0.8))
                    .frame(height: 30)
                    .animation(.none, value: vm.mapLocation)
                    .padding(.trailing)
            }
            
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.ultraThinMaterial)
        .cornerRadius(40)
        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 0)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.white.opacity(0.1), lineWidth: 1 )
        )
    }
    
    private var MapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: {location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.6)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationsPreviewStack: some View {
        ZStack{
            ForEach(vm.locations){ location in
                if vm.mapLocation == location { LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3),radius: 20)
                        .padding()
                        .padding(.bottom)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
