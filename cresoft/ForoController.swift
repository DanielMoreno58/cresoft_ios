//
//  ForoController.swift
//  cresoft
//
//  Created by Daniel Alexis Moreno Herrera on 4/21/19.
//  Copyright © 2019 Daniel Alexis Moreno Herrera. All rights reserved.
//

import UIKit
import CoreData

class ForoController: UIViewController {
    
    // Table View component
    @IBOutlet weak var QuestionList: UITableView!
    
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Question")
        request.returnsObjectsAsFaults = false
        do {
            let result = try PersistanceService.context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
            }
        } catch {
            print("Failed")
        }

        // Do any additional setup after loading the view.
    }

}

extension ForoController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = questions[indexPath.row].name
        return cell
    }
}
