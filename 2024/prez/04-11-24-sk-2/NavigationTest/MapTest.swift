//
//  MapTest.swift
//  NavigationTest
//
//  Created by student on 04.11.2024.
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

struct MyMapView: View {
   /* @State var camera = MKMapCamera(lookingAt: .forCurrentLocation(),
                                   forViewSize: CGSize(width: 200, height: 200),
                                    allowPitch: true)*/
    
   /* @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 49.2308,
                               longitude: 17.6571),
                                           span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    */
    
    @State var camera = MapCameraPosition.region(MKCoordinateRegion(center: .init(latitude: 49.2308, longitude: 17.6571),
                            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)))
    
  
    
    var body: some View {
        // Map(coordinateRegion: $region)
        // Map(position: $camera)
        
       
        Map {
            Marker("Vertikon", coordinate: .FAI)
            
            Annotation("FAI", coordinate: .init(latitude: 49.2308, longitude: 17.6571)){
                ZStack {
                    
                    Circle().foregroundStyle(.yellow)
                    
                    Text("FAI")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                       
                }
                
            }
        }
    }
}
