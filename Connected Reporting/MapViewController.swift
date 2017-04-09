//
//  MapViewController.swift
//  Connected Reporting
//
//  Created by Frank on 4/9/17.
//  Copyright © 2017 Frank. All rights reserved.
//

import UIKit
import GoogleMaps
import Foundation
import CoreLocation
class MapViewController: UIViewController,CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    var mapView: GMSMapView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            let marker = GMSMarker()
            let pos = locationManager.location?.coordinate
            marker.position = CLLocationCoordinate2D(latitude: (pos?.latitude)!, longitude: (pos?.longitude)!)
            marker.title = "Position"
            marker.snippet = "You are here"
            marker.map = mapView
        }
    }
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 37.3229978, longitude: -122.0321823, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
