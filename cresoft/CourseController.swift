//
//  CourseController.swift
//  cresoft
//
//  Created by Daniel Alexis Moreno Herrera on 4/22/19.
//  Copyright © 2019 Daniel Alexis Moreno Herrera. All rights reserved.
//

import UIKit

class CourseController: UIViewController {
    
    var courses = ["Mi primer videojuego en JS", "¿Como crear mi propia pagina web?"]
    var urlArray = ["http://google.com", "https://apple.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension CourseController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let urlString = self.urlArray[indexPath.row]
        print(urlString)
        if let url = URL(string: urlString)
        {
            UIApplication.shared.openURL(url)
        }

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseTable", for: indexPath)
        cell.textLabel?.text = courses[indexPath.row]
        return cell
    }
    
}
