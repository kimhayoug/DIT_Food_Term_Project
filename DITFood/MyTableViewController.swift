//
//  MyTableViewController.swift
//  DITFood
//
//  Created by D7703_11 on 2018. 6. 27..
//  Copyright © 2018년 dit.ac.kr. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var foodStores:[FoodStore] = [
        FoodStore(name: "영남관", image: "01", address: "부산광역시 부산진구 양지로 36", tel: "051-865-0032", menu: "짜장면", money:"5000",type: "중화요리"),
        FoodStore(name: "왕짜장", image: "01", address: "부산광역시 부산진구 진남로 505", tel: "051-852-0326", menu: "짜장면",  money:"5000",type: "중화요리"),
        FoodStore(name: "머거스", image: "03", address: "부산광역시 부산진구 전남로 499-1", tel: "051-868-5224", menu: "덮밥",  money:"5000", type: "덮밥"),
        FoodStore(name: "명동불백", image: "05", address: "부산광역시 부산진구 양지로 37-1", tel: "051-867-8581", menu: "명동불백",  money:"5000",type: "갈비양념"),
        FoodStore(name: "가야밀면", image: "02", address: "부산광역시 부산진구 동평로405번길 128", tel: "051-863-1144", menu: "가야밀면", money:"5000", type: "밀면"),
        FoodStore(name: "미쳐버린피닭", image: "04", address: "부산광역시 부산진구 중앙대로910번길15", tel: "051-851-2888", menu: "파닭치킨",  money:"5000",type: "치킨"),
        ]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = "DIT 배달통"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodStores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath)
        as! FoodStoreTableViewCell
        // Configure the cell...
        cell.foodStoreCellName.text = foodStores[indexPath.row].name
        cell.foodStoreCellImage.image = UIImage(named: foodStores[indexPath.row].image)
        cell.foodStoreCellAddress.text = foodStores[indexPath.row].address
        cell.foodStoreCellTel.text = foodStores[indexPath.row].tel
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath =  tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                
                destinationController.name = foodStores[indexPath.row].name
                destinationController.cellImage = foodStores[indexPath.row].image
                destinationController.local1 = foodStores[indexPath.row].address
                destinationController.tel1 = foodStores[indexPath.row].tel
                destinationController.menu = foodStores[indexPath.row].menu
                destinationController.type = foodStores[indexPath.row].type
                
            }
        } else if segue.identifier == "totalMapView" {
            let destinationController = segue.destination as! TotalMapViewController
            destinationController.totalFoodStores = foodStores
            
        }
    }
    }
    


