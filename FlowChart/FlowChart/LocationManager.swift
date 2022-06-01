//
//  LocationManager.swift
//  FlowChart
//
//  Created by Michael Durkin on 12/20/21.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init(){
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
    }
    
    func requestLocation (){
        manager.requestWhenInUseAuthorization()
    }
}
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            print("DEBUG")
        case .restricted:
            print("DEBUG")
        case .denied:
            print("DEBUG")
        case .authorizedAlways:
            print("DEBUG")
        case .authorizedWhenInUse:
            print("DEBUG")
        @unknown default:
            print("DEBUG")
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.userLocation = location
    }
}
