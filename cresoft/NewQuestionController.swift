//
//  NewQuestionController.swift
//  cresoft
//
//  Created by Daniel Alexis Moreno Herrera on 4/21/19.
//  Copyright © 2019 Daniel Alexis Moreno Herrera. All rights reserved.
//

import UIKit
import CoreData

class NewQuestionController: UIViewController, UITextFieldDelegate {

    @IBOutlet var question_content: UITextView!
    @IBOutlet var question_title: UITextField!
    
    
    @IBAction func AddQuestion(_ sender: UIButton) {
        let entity = NSEntityDescription.entity(forEntityName: "Question", in: PersistanceService.context)
        let newQuestion = NSManagedObject(entity: entity!, insertInto: PersistanceService.context)
        newQuestion.setValue(question_title.text, forKey: "name")
        newQuestion.setValue(question_content.text, forKey: "content")
        
        do {
            try PersistanceService.context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Change question_content border color
        question_content.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        question_content.layer.borderWidth = 1.0
        
        self.question_content.delegate = self as? UITextViewDelegate;
        self.addDoneButtonOnKeyboard()
        
        question_title.delegate = self
    
    }
    
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Terminar", style: UIBarButtonItem.Style.done, target: self, action: #selector(NewQuestionController.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.question_content.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.question_content.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
