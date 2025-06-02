//
//  LocationDetailView.swift
//  Map App
//
//  Created by Vinicius on 6/1/25.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    let location : Location
    
    var body: some View {
        ScrollView{
            VStack{
                ImageSlider
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16){
                    TextSection
                    DescptionSection
                    Divider()
                    MapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
            }
            
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topTrailing) {
            backButton
        }
    }
}

extension LocationDetailView {
    private var ImageSlider: some View {
        TabView{
            ForEach(location.imageNames, id : \.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                
                
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var TextSection : some View {
        VStack(alignment: .leading, spacing: 14){
            VStack(alignment: .leading , spacing: 1){
                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("\(location.cityName), \(location.country)")
                    .font(.title3)
                    .fontWeight(.semibold)
    
            }
        }
    }
    
    private var DescptionSection : some View {
        
        VStack(alignment: .leading, spacing: 8){
            Text(location.description)
                .font(.headline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link){
                Link("mais info", destination: url)
            }
        }
    }
    
    private var MapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: vm.mapSpan)),
            annotationItems: [location] ) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(20)
        .padding(1)
        .background(Color.white.opacity(0.5).cornerRadius(20).blur(radius: 0.5))
    }
    
    private var backButton: some View {
        Button{
            vm.sheetLocation = nil
            
        } label : {
            Image(systemName: "arrow.down")
                .font(.title2)
                .foregroundColor(.primary.opacity(0.8))
                .frame(width: 40, height: 40)
                .background(.thinMaterial)
                .cornerRadius(50)
                .padding(20)
        }
    }
}

#Preview {
    LocationDetailView(location : LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}
