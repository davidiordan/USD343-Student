//
//  BBViewController.swift
//  Student
//
//  Created by David Iordan on 6/7/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit

class BBViewController: UIViewController {

    @IBOutlet weak var bbWebView: UIWebView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var slideInView: UIView!
    @IBOutlet weak var coverviewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sideMenus()
        customizeNavBar()
        
        slideInView.layer.cornerRadius = 15
        slideInView.isHidden = true
        coverviewButton.isHidden = true
        
        let bbURL = URL(string: "https://usd343.blackboard.com")
        let bbURLRequest = URLRequest(url: bbURL!)
        bbWebView.loadRequest(bbURLRequest)
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
        bbWebView.goForward()
    }
    
    @IBAction func pressBackward(_ sender: Any) {
        bbWebView.goBack()
    }
    
    @IBAction func pressMoreOptions(_ sender: Any) {
        if(slideInView.isHidden) {
            slideInView.isHidden = false
            coverviewButton.isHidden = false
        } else {
            slideInView.isHidden = true
            coverviewButton.isHidden = true
        }
    }
    
    @IBAction func dismissMoreOptions(_ sender: Any) {
        slideInView.isHidden = true
        coverviewButton.isHidden = true
    }
    
    @IBAction func pressAppInstead(_ sender: Any) {
        if let url = NSURL(string: "bblearn://") {
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func inSafariInstead(_ sender: Any) {
        if let url = NSURL(string: "https://usd343.blackboard.com") {
            UIApplication.shared.open(url as URL)
        }
    }

    @IBAction func coverveiwButtonTap(_ sender: Any) {
        slideInView.isHidden = true
        coverviewButton.isHidden = true
    }
}
