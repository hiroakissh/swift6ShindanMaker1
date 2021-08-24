//
//  LoginViewController.swift
//  swift6ShindanMaker1
//
//  Created by HiroakiSaito on 2021/08/24.
//

import UIKit
import FirebaseAuth
import NVActivityIndicatorView

class LoginViewController: UIViewController {
    
    var provider:OAuthProvider?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.provider = OAuthProvider(providerID: TwitterAuthProvider)
        provider?.customParameters = ["kang":"ja"]
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
