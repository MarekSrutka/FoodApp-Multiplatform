//
//  LocationMapView.swift
//  FoodApp
//
//  Created by Marek Srutka on 27.03.2024.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @EnvironmentObject private var routeManagar: NavigationRouter
    @State private var cameraPosition: MapCameraPosition = .region(.init(center: .init(latitude: 48.859626, longitude: 16.047444), latitudinalMeters: 10000, longitudinalMeters: 10000))
    let item: any MenuItem
    
    var body: some View {
        Map(position: $cameraPosition) {
            Annotation("My Location", coordinate: .init(latitude: 48.859626, longitude: 16.047444)) {
                ZStack {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.blue.opacity(0.25))
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(.blue)
                }
            }
            
            ForEach(item.locations ?? [], id: \.id) { location in
                Annotation("", coordinate: .init(latitude: location.lat, longitude: location.long)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white.opacity(0.6))
                        Text(item.name)
                            .padding(5)
                    }
                }
            }
        }
        .mapControls {
            MapPitchToggle()
            MapCompass()
        }
        .toolbar(.hidden, for: .navigationBar)
        .safeAreaInset(edge: .bottom, content: {
            HStack {
                Spacer()
                Group {
                    Button("Back to Menu") {
                        routeManagar.reset()
                    }
                    
                    Button("Back") {
                        routeManagar.goBack()
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .padding(.top)
                
                Spacer()
            }
            .background(.thinMaterial)
        })
    }
}

#Preview {
    NavigationStack {
        LocationMapView(item: foods[2])
            .environmentObject(NavigationRouter())
    }
}
