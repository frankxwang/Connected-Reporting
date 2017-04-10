//
//  ReportingViewController.swift
//  Connected Reporting
//
//  Created by Frank on 4/8/17.
//  Copyright © 2017 Frank. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import CoreLocation
import AVFoundation
class ReportingViewController: UIViewController {
    var ref: FIRDatabaseReference!
    @IBOutlet weak var descriptionVal: UITextView!
    @IBOutlet weak var titleVal: UITextView!
    @IBAction func Report(_ sender: Any) {
        var num = 0
        ref.observe(.value, with: {snapshot in
            num = Int(snapshot.childrenCount)
        })
        self.ref.child(String(num)).child("Description").setValue(descriptionVal.text)
        self.ref.child(String(num)).child("Title").setValue(titleVal.text)
        self.ref.child(String(num)).child("Latit").setValue(CLLocationManager().location?.coordinate.latitude)
        self.ref.child(String(num)).child("Long").setValue(CLLocationManager().location?.coordinate.longitude)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        FIRAuth.auth()?.signInAnonymously()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ReportingViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
//        descriptionVal.returnKeyType = UIReturnKeyType.done
        // Do any additional setup after loading the view.
    }

    func dismissKeyboard() {
        view.endEditing(true)
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
