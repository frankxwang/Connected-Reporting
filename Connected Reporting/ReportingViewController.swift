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
class ReportingViewController: UIViewController {
    var ref: FIRDatabaseReference!
    
    @IBOutlet weak var descriptionVal: UITextView!
    @IBOutlet weak var titleVal: UITextView!
    @IBAction func Report(_ sender: Any) {
        self.ref.child(titleVal.text).setValue(descriptionVal.text)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        FIRAuth.auth()?.signInAnonymously()
        // Do any additional setup after loading the view.
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
