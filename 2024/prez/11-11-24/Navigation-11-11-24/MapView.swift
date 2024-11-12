//
//  MapView.swift
//  Navigation-11-11-24
//
//  Created by student on 11.11.2024.
//

import SwiftUI
import MapKit

// 49.2308° N, 17.6571° E

extension CLLocationCoordinate2D {
    static var FAI: CLLocationCoordinate2D {
        .init(latitude: 49.2308, longitude: 17.6571)
    }
    
    static var vertikon: CLLocationCoordinate2D {
        .init(latitude: 49.2304, longitude: 17.6538)
    }
}

struct MapView: View {
    @State var camera = MapCameraPosition.region(
        MKCoordinateRegion(center: 
    CLLocationCoordinate2D(
            latitude: 49.2308,
            longitude: 17.6571
    ),
                           
        span: MKCoordinateSpan(
            latitudeDelta: 0.01,
            longitudeDelta: 0.01
        )
        ) // MKCoordRegion
    ) // MapCameraPosition
    
    
    
    var body: some View {
       // Map(position: $camera)
        
        
        Map {
            Marker("Vertikon", coordinate: .vertikon)
            
            Annotation("FAI", coordinate: .FAI){
                ZStack {
                    Circle().foregroundStyle(.yellow)
                    Text("FAI")
                        .font(.system(size: 24,
                                      weight: .heavy,
                                      design: .rounded))
                }
            }
        }
    }
}
