//
//  PresentationProjectViewController.swift
//  Your Projects
//
//  Created by Carlos Modinez on 05/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class PresentationProjectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbvInfoProject: UITableView!
    var project : Project!
    
    override func viewDidLoad() {
        self.navigationItem.title = project.Name
        tbvInfoProject.delegate = self
        tbvInfoProject.dataSource = self
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "descriptionProject", for: indexPath) as! DescriptionProjectTableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "imageProject", for: indexPath) as! ImageProjectTableViewCell
        
        if indexPath.row == 0{
            cell1.txtDescriptionProject.text = project.Description
            cell1.txtDescriptionProject.isEditable = false
            cell1.txtDescriptionProject.isScrollEnabled = false
            cell1.txtDescriptionProject.sizeToFit()
            self.tbvInfoProject.rowHeight = cell1.txtDescriptionProject.frame.height + 40
            return cell1
        }
        else {
            cell2.imgProject.image = project.image
            self.tbvInfoProject.rowHeight = cell2.imgProject.frame.height
            return cell2
        }
    }
    


}
