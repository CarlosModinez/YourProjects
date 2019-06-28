//
//  MyProjectsViewController.swift
//  Your Projects
//
//  Created by Carlos Modinez on 05/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class MyProjectsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var viewAddNewProject: UIView!
    @IBOutlet weak var btnAddProject: UIView!
    @IBOutlet weak var cltAllProjects: UICollectionView!
    private var itemsPerRow: CGFloat = 2
    
    private let sectionInsets = UIEdgeInsets(top: 10.0,
                                             left: 10.0,
                                             bottom: 10.0,
                                             right: 10.0)
    
    override func viewWillAppear(_ animated: Bool) {
        cltAllProjects.reloadData()
        cltAllProjects.delegate = self
        cltAllProjects.dataSource = self
        viewAddNewProject.layer.borderWidth = 1
        viewAddNewProject.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.shared.projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "projectCollectionViewCell", for: indexPath) as! ProjectCollectionViewCell
        cell.lblProjectName.text = Model.shared.projects[indexPath.row].Name
        cell.imgProject.image = Model.shared.projects[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "projectDetails") as? PresentationProjectViewController {
            vc.project = Model.shared.projects[indexPath.row]
            self.navigationController?.show(vc, sender: self)
        }
    }
    
    @IBAction func addProjectPressed(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "addProject") as? AddNewProjectViewController {
            self.navigationController?.show(vc, sender: self)
        }
    }
}

extension MyProjectsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var paddingSpace : CGFloat = 0.0
        

        if view.frame.width > 414 {
            paddingSpace = sectionInsets.left * (itemsPerRow+2)
            itemsPerRow = 4
        }else {
            paddingSpace = sectionInsets.left * (itemsPerRow+2)
            itemsPerRow = 2
        }
        
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
