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
import Firebase
import FirebaseAuth
import FirebaseDatabase
class MapViewController: UIViewController,CLLocationManagerDelegate{
    var ref: FIRDatabaseReference!
    let locationManager = CLLocationManager()
    var num = 0
    var mapView: GMSMapView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if !CLLocationManager.locationServicesEnabled(){
            locationManager.requestAlwaysAuthorization()
        }else{
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            let marker = GMSMarker()
            let pos = locationManager.location?.coordinate
            marker.position = CLLocationCoordinate2D(latitude: (pos?.latitude)!, longitude: (pos?.longitude)!)
            marker.title = "Position"
            marker.snippet = "You are here"
            marker.map = mapView
            print(num)
            for i in 0..<num{
                let marker = GMSMarker()
                let info = ref.child(String(i))
                info.child("Description").observe(.value, with: { (snapshot) in
                    marker.snippet = snapshot.value as? String
                })
                info.child("Title").observe(.value, with: { (snapshot) in
                    marker.title = snapshot.value as? String
                })
                info.child("Latit").observe(.value, with: { (snapshot) in
                    marker.position.latitude = snapshot.value as! CLLocationDegrees
                    print("Got")
                })
                info.child("Long").observe(.value, with: { (snapshot) in
                    marker.position.longitude = snapshot.value as! CLLocationDegrees
                })
                marker.map = mapView
            }
        }
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        /*
        for i in 0..<num{
            if let latit = ref.child(String(i)).value(forKey: "Latit") as? Double, let long = ref.child(String(i)).value(forKey: "Long") as? Double,let description = ref.child(String(i)).value(forKey: "Description") as? String,let title = ref.child(String(i)).value(forKey: "Title") as? String{
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latit), longitude:CLLocationDegrees(long))
                    marker.snippet = description
                    marker.title = title
                    marker.map = self.mapView
                    print("Created Marker")
            }
            ref.child(String(i)).ref.queryOrdered(byChild: "Description").observe(.childAdded, with: { snapshot in
                if let latit = snapshot.value(forKey: "Latit") as? Double {
                    if let long = snapshot.value(forKey: "Long") as? Double{
                        print("\(latit) \(long)")
                        let marker = GMSMarker()
                        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latit), longitude:CLLocationDegrees(long))
                        marker.snippet = snapshot.childSnapshot(forPath: "Description").value as! String?
                        marker.title = snapshot.childSnapshot(forPath: "Title").value as! String?
                        marker.map = self.mapView
                    }
                }
            })
        }
        ref.observe(.value, with: {snapshot in
            num = Int(snapshot.childrenCount)
            
                let num = snapshot.childSnapshot(forPath: String(i))
                let latit = num.childSnapshot(forPath: "Latit").value
                let long = num.childSnapshot(forPath: "Long").description
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(latit)!), longitude: CLLocationDegrees(Double(long)!))
                marker.snippet = snapshot.childSnapshot(forPath: "Description").value as! String?
                marker.title = snapshot.childSnapshot(forPath: "Title").value as! String?
                marker.map = self.mapView
            }
        })
 */

    }
    override func loadView() {
        ref = FIRDatabase.database().reference()
        FIRAuth.auth()?.signInAnonymously()
        let camera = GMSCameraPosition.camera(withLatitude: 37.3229978, longitude: -122.0321823, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        ref.child("MarkerNum").observe(.value, with: { (snapshot) in
            self.num = snapshot.value as! Int
        })
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
