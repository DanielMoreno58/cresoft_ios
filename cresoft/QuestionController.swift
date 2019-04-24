//
//  QuestionController.swift
//  cresoft
//
//  Created by Daniel Alexis Moreno Herrera on 4/22/19.
//  Copyright © 2019 Daniel Alexis Moreno Herrera. All rights reserved.
//

import UIKit
import RealmSwift

class QuestionController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var QuestionTitle: UITextField!
    @IBOutlet weak var QuestionContent: UITextView!
    @IBOutlet weak var AnswerContent: UITextField!
    
    var index: Int!
    var questions: Results<Question>!
    var answers: Results<Answer>!
    
    @IBOutlet weak var AnswerList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        questions = realm.objects(Question.self)

        // Do any additional setup after loading the view.
        QuestionTitle.text = questions[index].name
        QuestionContent.text = questions[index].content
        
        let realm_answers = try! Realm()
        answers = realm_answers.objects(Answer.self)
        
        AnswerContent.delegate = self
        
    }
    
    @IBAction func AddAnswer(_ sender: UIButton) {
        let realm = try! Realm()
        
        let answer = Answer()
        answer.content = AnswerContent.text
        
        try! realm.write {
            realm.add(answer)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension QuestionController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "respuestas", for: indexPath)
        cell.textLabel?.text = answers[indexPath.row].content
        return cell
    }
    
}
