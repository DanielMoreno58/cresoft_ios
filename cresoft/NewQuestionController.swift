//
//  NewQuestionController.swift
//  cresoft
//
//  Created by Daniel Alexis Moreno Herrera on 4/21/19.
//  Copyright © 2019 Daniel Alexis Moreno Herrera. All rights reserved.
//

import UIKit

class NewQuestionController: UIViewController {

    @IBOutlet var question_content: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Change question_content border color
        question_content.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        question_content.layer.borderWidth = 1.0
        
        _ = UIBarButtonItem(title: "Terminar", style: .plain, target: self, action: #selector(self.doneAction))
    }
    
    @objc func doneAction(){
        question_content.resignFirstResponder()
    }

}
