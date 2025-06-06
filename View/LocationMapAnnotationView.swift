//
//  LocationMapAnnotationView.swift
//  Map App
//
//  Created by Vinicius on 6/1/25.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")

    var body: some View {
        VStack(spacing: 0){
            
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.purple)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundColor(Color.purple)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 35)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        LocationMapAnnotationView()
    }
}
