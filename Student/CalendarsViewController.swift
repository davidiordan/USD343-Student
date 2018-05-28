//
//  CalendarsViewController.swift
//  Student
//
//  Created by David Iordan on 7/4/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit

class CalendarsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func elementaryCalTap(_ sender: Any) {
        if let url = NSURL(string: "https://calendar.google.com/calendar/embed?src=dmp414f08doiqe9oobep99ih5g@group.calendar.google.com&ctz=America/Chicago"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func middleCalTap(_ sender: Any) {
        if let url = NSURL(string: "https://calendar.google.com/calendar/embed?src=37g47lamrdmbb8u9en5v118o08@group.calendar.google.com&ctz=America/Chicago"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func hsCalTap(_ sender: Any) {
        if let url = NSURL(string: "https://calendar.google.com/calendar/embed?src=nrj6lf9kaj6fpe4raiq7b9ugjk@group.calendar.google.com&ctz=America/Chicago&pli=1"){
            UIApplication.shared.open(url as URL)
        }
    }

    @IBAction func lunchMenuTaps(_ sender: Any) {
        if let url = NSURL(string: "http://usd343.nutrislice.com/") {
            UIApplication.shared.open(url as URL)
        }
    }
}
