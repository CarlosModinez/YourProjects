//
//  NextHandsOverViewController.swift
//  Your Projects
//
//  Created by Carlos Modinez on 04/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class NextHandsOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbvActivities: UITableView!
    var sections : [String]?
    
    override func viewWillAppear(_ animated: Bool) {
        
        tbvActivities.delegate = self
        tbvActivities.dataSource = self
        self.sections = assignSections()
        tbvActivities.reloadData()
    }
    
    //Atribui a quantidade de linhas para cada secao
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < sections!.count &&  Model.shared.projects[section].activities.count > 0{
            return Model.shared.projects[section].activities.count
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < sections!.count {
            return sections?[section]

        }
        else {
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections!.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section < sections!.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityViewCell
            
            if Model.shared.projects[indexPath.section].activities.count > 0 {
                cell.lblActivityName.text = Model.shared.projects[indexPath.section].activities[indexPath.row].name
                cell.lblDate.text = Model.shared.projects[indexPath.section].activities[indexPath.row].date
                
                if self.view.frame.width/self.view.frame.height < 0.55 {
                    tbvActivities.rowHeight = self.view.frame.height * 0.1
                }else {
                    tbvActivities.rowHeight = self.view.frame.height * 0.15
                }
            }else {
                cell.lblActivityName.text = ""
                cell.lblDate.text = ""
                tbvActivities.rowHeight = self.view.frame.height * 0.1
            }
            return cell
        
        }else {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "addActivityCell", for: indexPath) as! AddActivityViewCell
            tbvActivities.rowHeight = self.view.frame.height * 0.07
            return cell1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section < sections!.count && Model.shared.projects[indexPath.section].activities.count > 0 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "activityDetails") as? PresentationActivityViewController {
                vc.project = Model.shared.projects[indexPath.section]
                vc.activity = Model.shared.projects[indexPath.section].activities[indexPath.row]
                self.navigationController?.show(vc, sender: self)
            }
        }
        else {
            if Model.shared.projects.count > 0 {
                if let vc = storyboard?.instantiateViewController(withIdentifier: "addActivity") as? AddNewActivityViewController {
                    self.navigationController?.show(vc, sender: self)
                }
            }
            else{
                //Mensagem de erro que indica que não há projetos Criados
            }
        }
    }
    
    func assignSections() -> [String] {
        var sectionsName : [String] = []
        for i in 0..<Model.shared.projects.count {
            sectionsName.append(Model.shared.projects[i].Name)
        }
        return sectionsName
    }
    

}
