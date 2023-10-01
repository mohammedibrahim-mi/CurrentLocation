//
//  ContentView.swift
//  Currentlocation
//
//  Created by Mohammed Ibrahim on 01/10/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    
    @StateObject private var contentObj = ContentViewModel()
    
    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $contentObj.region, showsUserLocation: true)
                .ignoresSafeArea()
                .onAppear{
                    
                    contentObj.checkLocation()
                    
                }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
