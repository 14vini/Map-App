//
//  LocationPreviewView.swift
//  Map App
//
//  Created by Vinicius on 6/1/25.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0){
            VStack(alignment: .leading, spacing: 16) {
                
                ImageSection
                TitleSection
            }
            
            VStack(spacing: 8 ){
               
                learnMoreButton
                NextButton
                
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.white.opacity(0.1), lineWidth: 1 )
                .offset(y: 65)
        )
        
        .cornerRadius(40)
        .shadow(color: Color.black.opacity(0.3), radius: 3 , x: 0, y: 0)
    }
}

extension LocationPreviewView{
    private var ImageSection: some View {
        ZStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
            }
        }
        .padding(2)
        .background(Color.white.blur(radius: 15))
        .cornerRadius(20)
    }
    
    private var TitleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary.opacity(0.8))
            
            Text("\(location.cityName), \(location.country)")
                .font(.subheadline)
                .foregroundColor(.primary.opacity(0.8))

        }
        .frame(maxWidth: .infinity,alignment: .leading)

    }
    
    private var learnMoreButton: some View {
        Button{
            vm.sheetLocation = location
        } label: {
            Text("Ver mais")
                .font(.headline)
                .frame(width: 125, height: 36)
            
        }
        .buttonStyle(.borderedProminent)
        .tint(.blue)
        .cornerRadius(50)

    }
    
    private var NextButton: some View {
        Button{
            vm.nextButtonPressed()
        } label: {
            Text("Próximo")
                .font(.headline)
                .frame(width: 125, height: 36)
            
        }
        .buttonStyle(.bordered)
        .tint(.cyan)
        .cornerRadius(50)
    
    }
}



#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
    .environmentObject(LocationsViewModel())
}
