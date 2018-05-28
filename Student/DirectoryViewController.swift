//
//  DirectoryViewController.swift
//  Student
//
//  Created by David Iordan on 7/7/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit

class DirectoryViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sideMenus()
        customizeNavigationBar()
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
    
    func customizeNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        //below is the code for the button item colors
        navigationController?.navigationBar.tintColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //below is the code for the bar color
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 42/255, green: 98/255, blue: 190/255, alpha: 1)
        //below is the code for the bar Title color and font
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "Lato-Heavy", size: 22)!]
    }
    
    @IBAction func elementaryDirectory(_ sender: Any) {
        if let url = NSURL(string: "http://www.usd343.net/vnews/display.v/SEC/Perry%20and%20Lecompton%20Elementary%20Schools%7CStaff") {
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func middleDirectory(_ sender: Any) {
        if let url = NSURL(string: "http://www.usd343.net/vnews/display.v/SEC/Perry%20Lecompton%20Middle%20School%7CFaculty%20Information") {
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func highschoolDirectory(_ sender: Any) {
        if let url = NSURL(string: "http://www.usd343.net/vnews/display.v/SEC/Perry%20Lecompton%20High%20School%7CStaff") {
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func districtOfficeDirectory(_ sender: Any) {
        if let url = NSURL(string: "http://www.usd343.net/vnews/display.v/SEC/District%20Office%7CStaff%20Directory") {
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func boardOfEduDirectory(_ sender: Any) {
        if let url = NSURL(string: "http://www.usd343.net/vnews/display.v/ART/474d71150b1c2") {
            UIApplication.shared.open(url as URL)
        }
    }
}
