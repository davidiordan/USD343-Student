//
//  PlannerViewController.swift
//  Student
//
//  Created by David Iordan on 7/7/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit

class PlannerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var assignments: [Assignment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        sideMenus()
        customizeNavBar()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: nil)
        let assignment = assignments[indexPath.row]
        cell.indentationLevel = 2
        //cell.backgroundColor = UIColor(colorLiteralRed: 223/255, green: 226/255, blue: 230/255, alpha: 1)
        cell.textLabel?.font = UIFont(name: "Lato-Heavy", size: 17)
        cell.detailTextLabel?.font = UIFont(name: "Lato-Regular", size: 13)
        
        cell.textLabel?.text = "\(assignment.name!)"
        cell.detailTextLabel?.text = "\(assignment.desc!) - \(assignment.course!)"
        
        //cell.textLabel?.text = "Test"
        //cell.detailTextLabel?.text = "Test Desc"
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(assignments.count)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return(true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let remove = UITableViewRowAction(style: .normal, title: "Remove") {
            action, index in print("Remove Button Pressed")
            let assignment = self.assignments[indexPath.row]
            context.delete(assignment)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                self.assignments = try context.fetch(Assignment.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
            tableView.reloadData()
        }
        remove.backgroundColor = UIColor(colorLiteralRed: 213/255, green: 22/255, blue: 60/255, alpha: 1)
        
        return[remove]
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
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            assignments = try context.fetch(Assignment.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }
    
}
