//
//  PresentationActivityViewController.swift
//  Your Projects
//
//  Created by Carlos Modinez on 05/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class PresentationActivityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tbvInfoActivity: UITableView!
    var activity : Activity!
    var project : Project!
    
    override func viewDidLoad() {
        navigationItem.title = "Activity"
        tbvInfoActivity.delegate = self
        tbvInfoActivity.dataSource = self
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath) as! NameTableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "projectName", for: indexPath) as! ProjectNameTableViewCell
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "deadline", for: indexPath) as! DeadlineActivityTableViewCell
        let cell4 = tableView.dequeueReusableCell(withIdentifier: "description", for: indexPath) as! DescriptionTableViewCell
        
        if indexPath.row == 0 {
            cell1.lblactivityName.text = activity.name
            self.tbvInfoActivity.rowHeight = cell1.lblactivityName.frame.height + 30
            return cell1
        }
        else if indexPath.row == 1 {
            cell2.lblprojectName.text = project.Name
            return cell2
        }
        else if indexPath.row == 2 {
            cell3.lbldate.text = activity.date
            return cell3
        }
        else {
            cell4.txtActivityDescription.text = activity.description
            cell4.txtActivityDescription.isEditable = false
            cell4.txtActivityDescription.isScrollEnabled = false
            cell4.txtActivityDescription.sizeToFit()
            self.tbvInfoActivity.rowHeight = cell4.txtActivityDescription.frame.height + 60
            return cell4
        }
    }
    
    
}
