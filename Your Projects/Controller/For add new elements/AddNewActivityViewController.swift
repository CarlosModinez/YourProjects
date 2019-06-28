//
//  AddNewActivityViewController.swift
//  Your Projects
//
//  Created by Carlos Modinez on 06/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class AddNewActivityViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var pcvProjects: UIPickerView!
    @IBOutlet weak var inputTxtIntoProject: UITextField!
    @IBOutlet weak var inputTxtActivityTitle: UITextField!
    @IBOutlet weak var btnAddActivity: UIButton!
    
    var newActivity = Activity()
    var projects = Model.shared.projects
    var projectPositionInModel = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Atividade"
        
        inputTxtIntoProject.delegate = self
        inputTxtActivityTitle.delegate = self
        
        btnAddActivity.isEnabled = false
        btnAddActivity.isHidden = true
        
        pcvProjects.dataSource = self
        pcvProjects.delegate = self
        pcvProjects.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTxtIntoProject.resignFirstResponder()
        inputTxtActivityTitle.resignFirstResponder()
        return true
    }
    
    // Codigo do PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return projects.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        projectPositionInModel = row
        return projects[row].Name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inputTxtIntoProject.text = projects[row].Name
    }
    //_________________ termino do código do pickerView
    
    
    @IBAction func addActivityTitle(_ sender: UITextField) {
        newActivity.name = sender.text!
        view.endEditing(true)
        pcvProjects.isHidden = true
        
        //Nao habilita o botao se não houver título
        if newActivity.name != ""{
            btnAddActivity.isEnabled = true
            btnAddActivity.isHidden = false
        }
    }
    
    @IBAction func addProject(_ sender: Any) {
        view.endEditing(true)
        pcvProjects.isHidden = false
    }
    @IBAction func addProjectEnd(_ sender: Any) {
        pcvProjects.isHidden = true
    }
    @IBAction func addActivityDeadline(_ sender: UITextField) {
        newActivity.date = sender.text!
        pcvProjects.isHidden = true
        view.endEditing(true)
    }
    @IBAction func addActivityDescription(_ sender: UITextField) {
        newActivity.description = sender.text!
        pcvProjects.isHidden = true
    }
    @IBAction func addNewActivityPressed(_ sender: Any) {
        Model.shared.projects[projectPositionInModel].activities.append(newActivity)
        print(Model.shared.projects[projectPositionInModel].Name)
        self.navigationController?.popViewController(animated: true)
    }
    

}
