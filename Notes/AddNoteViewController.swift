//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Gayatri Patil on 23/03/18.
//  Copyright © 2018 Gayatri Patil. All rights reserved.
//

import UIKit
import CoreData
class AddNoteViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textViewNote: UITextView!
    let context = AppDelegate().persistentContainer.viewContext
    
    @IBOutlet weak var btnSave: UIBarButtonItem!
    @IBAction func btnSaveTapped(_ sender: UIBarButtonItem) {
        print("in load")
        
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Notes", into: context) as! Notes
        
        entity.noteText = textViewNote.text
        
        try! context.save()
        navigationController?.popViewController(animated: true)
     
        
    }
    
    @objc func enablebtn(){
        print("change")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textViewNote.delegate = self
        
//        textViewNote.isUserInteractionEnabled = true
//        var gesture = UITapGestureRecognizer(target: self, action: #selector(enablebtn))
//        textViewNote.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        btnSave.isEnabled = !textViewNote.text.isEmpty
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
