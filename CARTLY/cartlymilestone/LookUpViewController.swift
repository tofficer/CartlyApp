//
//  LookUpViewController.swift
//  cartlymilestone
//
//  Created by Garrett Andrews on 5/5/16.
//  Copyright © 2016 Geetika Batra. All rights reserved.
//

import UIKit

class LookUpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var foodCartsL0 = [foodCart]()
    var foodCartsL1 = [foodCart]()
    var searchDB = [searchDBItem]()

    var searchText = String()
    var located = Bool()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var userString: UITextField!

    @IBAction func submitButton(sender: AnyObject) {
        searchText = self.userString.text!;
        print(searchText)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for object in foodCartsL0 as [foodCart] {
            print(object.name)
            if object.isAtLocation == 1 {
                let locString = "Dayton Street"
                let newDBItem0 = searchDBItem(name: object.name, location: locString)
                searchDB.append(newDBItem0)
            }
        }
        for object in foodCartsL1 as [foodCart] {
            print(object.name)
            if object.isAtLocation == 1 {
                let locString = "Library Mall/State Street"
                let newDBItem1 = searchDBItem(name: object.name, location: locString)
                searchDB.append(newDBItem1)
            }
        }
        print(searchDB)
        
        located = false
        
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("cartLocation", forIndexPath: indexPath)
        
        for object in searchDB as [searchDBItem] {
            if (object.name == searchText){
                cell.textLabel?.text = object.location
                located = true
                break
            }
        }
        if (located == false){
            cell.textLabel?.text = "NOT FOUND"
        }
        print(located)
        return cell

        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if (located == true){
            self.performSegueWithIdentifier("TO_FOOD_FROM_LOOKUP", sender: nil)
        }
        
        
    }
    
    // MARK: - Navigation
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            if (segue.identifier == "TO_FOOD_FROM_LOOKUP") {
                let vc:FoodViewController = segue.destinationViewController as! FoodViewController
                
                vc.menuString = searchText
            }
    }

}
