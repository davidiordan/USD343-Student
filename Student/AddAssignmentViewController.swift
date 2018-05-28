//
//  AddAsnmtViewController.swift
//  Student
//
//  Created by David Iordan on 6/29/17.
//  Copyright © 2017 magmaDev. All rights reserved.
//

import UIKit

class AddAssignmentViewController: UIViewController {
    
    @IBOutlet weak var asnmtNameField: UITextField!
    @IBOutlet weak var asnmtDescField: UITextField!
    @IBOutlet weak var asnmtClassField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.isTranslucent = true
        toolbar.barTintColor = UIColor(colorLiteralRed: 77/255, green: 77/255, blue: 77/255, alpha: 1)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        doneButton.tintColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        asnmtNameField.inputAccessoryView = toolbar
        asnmtDescField.inputAccessoryView = toolbar
        asnmtClassField.inputAccessoryView = toolbar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doneClicked() {
        view.endEditing(true)
    }
    
    @IBAction func addTask(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let assignment = Assignment(context: context)
        if(asnmtNameField.text != "") {
            assignment.name = asnmtNameField.text
            if(asnmtDescField.text == "") {
                assignment.desc = "Blank Description"
            }
            if(asnmtClassField.text == "") {
                assignment.course = "No Class"
            }
            assignment.desc = asnmtDescField.text
            assignment.course = asnmtClassField.text
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            navigationController!.popViewController(animated: true)
        } else {
            createAlert(titleText: "Blank Assignment Saved", messageText: "This assignment will be saved without a name, description and associated class")
            
            assignment.name = "Blank Name"
            assignment.desc = "Blank Description"
            assignment.course = "No Class"
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            navigationController!.popViewController(animated: true)
        }
    }
    
    func createAlert(titleText: String, messageText: String) {
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    
}
