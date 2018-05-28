//
//  settingsTableViewController.swift
//  Student
//
//  Created by David Iordan on 6/15/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit

class settingsTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    let socialURLs = ["http://www.usd343.net/vnews/display.v/SEC/District%20Office", "https://www.facebook.com/usd343", "https://twitter.com/usd343"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        sideMenus()
        customizeNavBar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor(colorLiteralRed: 42/255, green: 98/255, blue: 190/255, alpha: 1)
        let font = UIFont(name: "Lato-Regular", size: 15.0)
        headerView.textLabel?.font = font!
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url : URL?
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
                case 0:
                    url = URL(string: socialURLs[0])
                case 1:
                    url = URL(string: socialURLs[1])
                case 2:
                    url = URL(string: socialURLs[2])
                default:
                    return
            }
        default:
            return
        }
        
        if(url != nil) {
            UIApplication.shared.open(url!)
        }
    }

}
