//
//  ViewNoteViewController.swift
//  Notes
//
//  Created by Gayatri Patil on 23/03/18.
//  Copyright © 2018 Gayatri Patil. All rights reserved.
//

import UIKit
import CoreData
class ViewNoteViewController: UIViewController {
    var noteTextObj : Notes!
    var context = AppDelegate().persistentContainer.viewContext
    @IBOutlet weak var textFieldViewNote: UITextView!
    
  
    var btnEdit : UIBarButtonItem!
    var btnSave : UIBarButtonItem!
    
    @objc func btnEditTapped (){
        textFieldViewNote.isEditable = true
        navigationItem.rightBarButtonItem = btnSave
        
    }
    
    
    @objc func btnSaveTapped (){
        textFieldViewNote.isEditable = false
        noteTextObj.noteText = textFieldViewNote.text
        try! context.save()
        navigationItem.rightBarButtonItem = btnEdit
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldViewNote.text = noteTextObj.noteText
        btnSave = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(btnSaveTapped))
        btnEdit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(btnEditTapped))
        navigationItem.rightBarButtonItem = btnEdit
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
