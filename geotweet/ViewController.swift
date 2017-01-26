//
//  ViewController.swift
//  geotweet
//
//  Created by GELE Axel on 13/01/2017.
//  Copyright © 2017 GELE Axel. All rights reserved.
//

import UIKit
import TwitterKit

class ConnexionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                NSLog("signed in as \(session!.userName)");
                let myMapViewController = MapViewController()
                self.navigationController?.pushViewController(myMapViewController, animated: true)
            } else {
                NSLog("error: \(error?.localizedDescription)");
            }
        })
        
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
//        let logOutButton = UIButton(frame: CGRect(x: 0, y: 100, width: 300, height: 50))
//        logOutButton.setTitle("Logout", for: .normal)
//        logOutButton.addTarget(nil, action: #selector(self.logout), for: UIControlEvents.touchDown)
//        logOutButton.backgroundColor = UIColor.blue
//        self.view.addSubview(logOutButton)

        
//        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID
//        {
//            Twitter.sharedInstance().sessionStore.logOutUserID(userID)
//        }
        
//        logInButton.frame.origin.x = 50
//        logInButton.frame.origin.y = 300
//        self.view.addSubview(logInButton)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func logout()
    {
        let store = Twitter.sharedInstance().sessionStore
        
        if let UserID = store.session()?.userID{
            NSLog("logout \(UserID)")
            store.logOutUserID(UserID)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

