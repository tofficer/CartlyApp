//
//  Location0TableViewController.swift
//  cartlymilestone
//
//  Created by Garrett Andrews on 5/2/16.
//  Copyright © 2016 Geetika Batra. All rights reserved.
//

import UIKit

class Location1TableViewController: UITableViewController {
    
    var foodCartsL1 = [foodCart]()
    var row = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var i = 0
        for object in foodCartsL1 as [foodCart] {
            if object.isAtLocation == 0 {
                foodCartsL1.removeAtIndex(i)
            }
            else {
            i = i+1
            }
        }
        return foodCartsL1.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cartCell", forIndexPath: indexPath)
        
        // Configure the cell
        let currentCart = foodCartsL1[indexPath.row]
            cell.textLabel?.text = currentCart.name
            return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        row = indexPath.row
        
        self.performSegueWithIdentifier("TO_FOOD_FROM_L1", sender: nil)
    }
    
    // MARK: - Navigation
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "TO_FOOD_FROM_L1") {
            let vc:FoodViewController = segue.destinationViewController as! FoodViewController
            
            vc.menuString = foodCartsL1[row].name
        }
        
    }
    
}
