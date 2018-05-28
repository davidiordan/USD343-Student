//
//  AboutTableViewController.swift
//  Student
//
//  Created by David Iordan on 7/7/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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

}
