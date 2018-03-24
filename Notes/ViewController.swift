//
//  ViewController.swift
//  Notes
//
//  Created by Gayatri Patil on 23/03/18.
//  Copyright © 2018 Gayatri Patil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var listNotes = [Notes]()
    let context = AppDelegate().persistentContainer.viewContext
    @IBOutlet weak var tableViewNotes: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listNotes = try! context.fetch(Notes.fetchRequest())
    
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotes.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = listNotes[indexPath.row].noteText
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    override func viewWillAppear(_ animated: Bool) {
        print("caled wil apear")
        listNotes = try! context.fetch(Notes.fetchRequest())
        self.tableViewNotes.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            var obj = listNotes[indexPath.row]
            context.delete(obj)
            try! context.save()
            listNotes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNote"{
        let addVC = segue.destination as! AddNoteViewController
        
        
        }
    }
}

