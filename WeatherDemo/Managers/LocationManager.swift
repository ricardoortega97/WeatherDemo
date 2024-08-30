//
//  LocationManager.swift
//  WeatherDemo
//
//  Created by Ricardo Ortega on 8/30/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? //Might not get a location therefore optioal
    @Published var isloading = false
    
    override init() {
        super .init()
        manager.delegate = self
    }
    
    func requestLocation(){
        isloading = true
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]) {
        let location = location.first?.coordinate
        isloading = false//Got the location therefore now false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting location", error)
        isloading = false
    }
}
