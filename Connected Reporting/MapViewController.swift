//
//  MapViewController.swift
//  Connected Reporting
//
//  Created by Frank on 4/9/17.
//  Copyright © 2017 Frank. All rights reserved.
//

import UIKit
import GoogleMaps
class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate 37.3229978, -122.0321823 at zoom level 13.
        let camera = GMSCameraPosition.camera(withLatitude: 37.3229978, longitude: -122.0321823, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.3229978, longitude:  -122.0321823)
        marker.title = "Cupertino_Test"
        marker.snippet = "Test"
        marker.map = mapView
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
