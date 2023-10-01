//
//  ContentViewModel.swift
//  Currentlocation
//
//  Created by Mohammed Ibrahim on 01/10/23.
//

import Foundation
import MapKit


class ContentViewModel : NSObject, ObservableObject,CLLocationManagerDelegate{
    
    // region to set location long,latitude data
    
    @Published var region  : MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 3.556, longitude: 3.9), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    //location manager has all details about location
    
    var locationManager : CLLocationManager?
    
    
    
    func checkLocation(){
        
        //only if location enabled
        
        if(CLLocationManager.locationServicesEnabled()){
            
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.delegate = self
            
            guard let locationManager = locationManager else{ return }
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            

        }
        else {
            
            print("location not enabled")
        }
    }
    
    
    
    
    private func checkLocationAuthorize(){
        
        
        guard let locationManager = locationManager else{ return }
        
        switch locationManager.authorizationStatus{
            
            
        case .authorizedAlways :
            
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
        
            
            
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedWhenInUse:
            print("authorizedWhenInuse")
        @unknown default:
            break
        }

        
    }
    
    
    // check permission is changed or not
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorize()
    }
    
    
}
