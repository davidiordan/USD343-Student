//
//  DirectionsViewController.swift
//  Student
//
//  Created by David Iordan on 6/9/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit
import MapKit

class DirectionsViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var useGoogleMaps: Bool!
    var useAppleMaps: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenus()
        customizeNavBar()
        
        // Do any additional setup after loading the view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenus() {
        if(revealViewController() != nil) {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    func customizeNavBar() {
        navigationController?.navigationBar.isTranslucent = false
        //below is the code for the button item colors
        navigationController?.navigationBar.tintColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //below is the code for the bar color
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 42/255, green: 98/255, blue: 190/255, alpha: 1)
        //below is the code for the bar Title color and font
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "Lato-Heavy", size: 22)!]
    }
    
    @IBAction func acchsDirections(_ sender: Any) {
        let mapURL = NSURL(string: "http://maps.apple.com/?q=908%20Tiger%20Rd,%20Effingham,%20KS%2066023")!
        let isAvailable = UIApplication.shared.canOpenURL(mapURL as URL)
        if isAvailable {
            UIApplication.shared.open(mapURL as URL)
        }
    }
    
    @IBAction func hiawathaDirections(_ sender: Any) {
        let mapURL = NSURL(string: "http://maps.apple.com/?q=600%20Red%20Hawk%20Dr,%20Hiawatha,%20KS%2066434")!
        let isAvailable = UIApplication.shared.canOpenURL(mapURL as URL)
        if isAvailable {
            UIApplication.shared.open(mapURL as URL)
        }
    }
    
    @IBAction func holtonDirections(_ sender: Any) {
        let mapURL = NSURL(string: "http://maps.apple.com/?q=901%20New%20York%20Avenue%20Holton,%20KS%2066436")!
        let isAvailable = UIApplication.shared.canOpenURL(mapURL as URL)
        if isAvailable {
            UIApplication.shared.open(mapURL as URL)
        }
    }
    
    @IBAction func jeffWestDirections(_ sender: Any) {
        let mapURL = NSURL(string: "http://maps.apple.com/?q=619%20Condray%20St,%20Meriden,%20KS%2066512")!
        let isAvailable = UIApplication.shared.canOpenURL(mapURL as URL)
        if isAvailable {
            UIApplication.shared.open(mapURL as URL)
        }
    }

    @IBAction func nemahaDirections(_ sender: Any) {
        let mapURL = NSURL(string: "http://maps.apple.com/?q=214%20N%2011th%20St,%20Seneca,%20KS%2066538")!
        let isAvailable = UIApplication.shared.canOpenURL(mapURL as URL)
        if isAvailable {
            UIApplication.shared.open(mapURL as URL)
        }
    }
    
    @IBAction func riversideDirections(_ sender: Any) {
        let mapURL = NSURL(string: "http://maps.apple.com/?q=705%20Jessie%20St,%20Wathena,%20KS%2066090")!
        let isAvailable = UIApplication.shared.canOpenURL(mapURL as URL)
        if isAvailable {
            UIApplication.shared.open(mapURL as URL)
        }
    }
    
    @IBAction func royalValleyDirections(_ sender: Any) {
        let mapURL = NSURL(string: "http://maps.apple.com/?q=101%20E%201st%20St,%20Hoyt,%20KS%2066440")!
        let isAvailable = UIApplication.shared.canOpenURL(mapURL as URL)
        if isAvailable {
            UIApplication.shared.open(mapURL as URL)
        }
    }
    
    @IBAction func sabethaDirections(_ sender: Any) {
        let mapURL = NSURL(string: "http://maps.apple.com/?q=1011%20Blue%20Jay%20Dr,%20Sabetha,%20KS%2066534")!
        let isAvailable = UIApplication.shared.canOpenURL(mapURL as URL)
        if isAvailable {
            UIApplication.shared.open(mapURL as URL)
        }
    }
}
