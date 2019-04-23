//
//  QuestionController.swift
//  cresoft
//
//  Created by Daniel Alexis Moreno Herrera on 4/22/19.
//  Copyright © 2019 Daniel Alexis Moreno Herrera. All rights reserved.
//

import UIKit
import RealmSwift

class QuestionController: UIViewController {

    @IBOutlet weak var QuestionTitle: UITextField!
    @IBOutlet weak var QuestionContent: UITextView!
    
    var index: Int!
    var questions: Results<Question>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        questions = realm.objects(Question.self)

        // Do any additional setup after loading the view.
        QuestionTitle.text = questions[index].name
        QuestionContent.text = questions[index].content
        
    }
    

}
