//
//  AddNewProjectViewController.swift
//  Your Projects
//
//  Created by Carlos Modinez on 06/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class AddNewProjectViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var inpuTxtProjectName: UITextField!
    @IBOutlet weak var inputTxtProjectDescription: UITextField!
    @IBOutlet weak var btnAddProject: UIButton!
    
    var image = UIImagePickerController()
    var newProject = Project()
    var model = Model.shared
    
    
    @IBOutlet weak var imgProject: UIImageView!
    override func viewDidLoad() {
        
        navigationItem.title = "Add Projeto"
        
        btnAddProject.isEnabled = false
        btnAddProject.isHidden = true
        
        
        //Posso fazer isso???
        inpuTxtProjectName.delegate = self
        inputTxtProjectDescription.delegate = self
        
        image.delegate = self
        
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inpuTxtProjectName.resignFirstResponder()
        inputTxtProjectDescription.resignFirstResponder()
        return true
    }
    
    @IBAction func addProjectName(_ sender: UITextField) {
        newProject.Name = sender.text!
        view.endEditing(true)
        
        if newProject.Name != ""{
            btnAddProject.isEnabled = true
            btnAddProject.isHidden = false
        }
    }
    
    @IBAction func addProjectdescription(_ sender: UITextField) {
        newProject.Description = sender.text!
        view.endEditing(true)
    }
    
    // Código do recebimento da imagem
    @IBAction func chooseImagePressed(_ sender: Any) {
        image.sourceType = .photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true) {
        }
    }
    
    @IBAction func takePhotoPressed(_ sender: Any) {
        image.sourceType = .camera
        image.allowsEditing = true
        self.present(image, animated: true) {
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imgProject.image = image
            newProject.image = imgProject.image!
        }
        else {
            //mensagem de erro
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewProjetPressed(_ sender: Any) {
        Model.shared.projects.append(newProject)
        self.navigationController?.popViewController(animated: true)
    }
    
}

