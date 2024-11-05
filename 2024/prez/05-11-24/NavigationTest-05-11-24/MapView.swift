//
//  MapView.swift
//  NavigationTest-05-11-24
//
//  Created by student on 05.11.2024.
//

import SwiftUI
import MapKit

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
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 49.2308,
                                       longitude: 17.6571),
                                                                    
                            span: MKCoordinateSpan(latitudeDelta: 0.03,
                               longitudeDelta: 0.03)))
    
    
                                                 
        var vertikonCoord = CLLocationCoordinate2D(latitude: 49.2308,
                                           longitude: 17.6538)
    var body: some View {
       // Map(position: $camera)
        
        Map {
            Marker("Vertikon", coordinate: .vertikon)
            
            Annotation("FAI", coordinate: .FAI){
                ZStack {
                    Circle().foregroundStyle(.yellow)
                    Text("FAI")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                    
                }
            }
        }
    }
}
