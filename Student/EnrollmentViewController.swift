//
//  EnrollmentViewController.swift
//  Student
//
//  Created by David Iordan on 6/9/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit

class EnrollmentViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var slideInMenu: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()
        customizeNavBar()

        // Do any additional setup after loading the view.
        
        slideInMenu.layer.cornerRadius = 15
        slideInMenu.isHidden = true
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
    
    @IBAction func openInSafari(_ sender: Any) {
        if let url = NSURL(string: "http://www.usd343.net/vnews/display.v/SEC/Parents%20and%20Students%7CEnrollment%3E%3EForms"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func pressMoreOptions(_ sender: Any) {
        if(slideInMenu.isHidden) {
            slideInMenu.isHidden = false
        } else {
            slideInMenu.isHidden = true
        }
    }
    
    @IBAction func dismissMoreOptions(_ sender: Any) {
        slideInMenu.isHidden = true
    }

}
