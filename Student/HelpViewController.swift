//
//  HelpViewController.swift
//  Student
//
//  Created by David Iordan on 7/6/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit
import MessageUI

class HelpViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func emailDevTap(_ sender: Any) {
        if(!MFMailComposeViewController.canSendMail()) {
            print("Mail services not available.")
            return
        } else {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            composeVC.setToRecipients(["davidiordan@icloud.com"])
            composeVC.setSubject("Message From USD343 Student App")
            composeVC.setMessageBody("Hello, ", isHTML: false)
            self.present(composeVC, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}
