//
//  ContentView.swift
//  RunningApp
//
//  Created by Student on 03.11.2021.
//

import SwiftUI
import CoreLocation
import MapKit


class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    var manager = CLLocationManager()
    var latest = CLLocation(latitude: 0, longitude: 0)
    var first = CLLocation(latitude: 0, longitude: 0)
    
    var myLocations = [CLLocation]()
    
    @Published var distance: Double = 0.0
    
    @Published
    var region = MKCoordinateRegion(center: .init(latitude: 0, longitude: 0),
                                    span: MKCoordinateSpan(latitudeDelta: 0.05,
                                                           longitudeDelta: 0.05))
    
    func startUpdatingLocation(){
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (locations.count > 0){
            myLocations.append(locations.last!)
        }
        
        if (myLocations.count > 2){
            let preLast = myLocations[myLocations.count - 2]
            let latest = myLocations.last!
            
            distance += latest.distance(from: preLast)
            
            print("Updated")
            
            self.region = MKCoordinateRegion(center: myLocations.last!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
        }
    }
    
    
                                 
    
}

struct ContentView: View {
    @EnvironmentObject var manager: LocationManager
    @State var trackingMode = MapUserTrackingMode.follow
    
    var body: some View {
        VStack {
            Text("You have travelled:")
            Text("\(manager.distance)")
            
            Button("Start"){
                manager.startUpdatingLocation()
            }
            
            Map(coordinateRegion: $manager.region, showsUserLocation: true, userTrackingMode: $trackingMode)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
