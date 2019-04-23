//
//  ForoController.swift
//  cresoft
//
//  Created by Daniel Alexis Moreno Herrera on 4/21/19.
//  Copyright © 2019 Daniel Alexis Moreno Herrera. All rights reserved.
//

import UIKit
import RealmSwift

class ForoController: UIViewController {
    
    // Table View component
    @IBOutlet weak var QuestionList: UITableView!
    
    var selectedRow: Int?
    
    var questions: Results<Question>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        questions = realm.objects(Question.self)
        // Do any additional setup after loading the view.
        realm.autorefresh = true
        
    }

}

extension ForoController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = QuestionList.indexPathForSelectedRow
        var vc = segue.destination as! QuestionController
        
        if segue.identifier == "segueForo" {
            vc.index = indexPath?.row
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "preguntas", for: indexPath)
        cell.textLabel?.text = questions[indexPath.row].name
        return cell
    }

}
