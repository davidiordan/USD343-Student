//
//  GoogleDriveViewController.swift
//  Student
//
//  Created by David Iordan on 6/1/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit

class GoogleDriveViewController: UIViewController {

    @IBOutlet weak var driveWV: UIWebView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var slideInMenu: UIView!
    @IBOutlet weak var coverView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()
        customizeNavBar()
        
        // Do any additional setup after loading the view.
       
        slideInMenu.layer.cornerRadius = 15
        slideInMenu.isHidden = true
        coverView.isHidden = true
        
        let driveURL = URL(string: "https://www.drive.google.com/")
        let driveURLRequest = URLRequest(url: driveURL!)
        driveWV.loadRequest(driveURLRequest)
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
    
    @IBAction func pressForward(_ sender: Any) {
        driveWV.goForward()
    }
    
    @IBAction func pressBackwards(_ sender: Any) {
        driveWV.goBack()
    }
    
    @IBAction func driveApp(_ sender: Any) {
        if let url = NSURL(string: "googledrive://") {
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func inSafariInstead(_ sender: Any) {
        if let url = NSURL(string: "https://www.drive.google.com/") {
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func pressMoreOptions(_ sender: Any) {
        if(slideInMenu.isHidden) {
            slideInMenu.isHidden = false
            coverView.isHidden = false
        } else {
            slideInMenu.isHidden = true
            coverView.isHidden = true
        }
    }
    
    @IBAction func dismissMoreOptions(_ sender: Any) {
        slideInMenu.isHidden = true
        coverView.isHidden = true
    }

    @IBAction func coverviewButtonTap(_ sender: Any) {
        slideInMenu.isHidden = true
        coverView.isHidden = true
    }
}
