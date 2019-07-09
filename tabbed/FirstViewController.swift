//
//  FirstViewController.swift
//  tabbed
//
//  Created by MacStudent on 2019-07-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
  
    
    @IBOutlet weak var colorTableView: UITableView!
    
    var colorsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.colorTableView.delegate = self
        self.colorTableView.dataSource = self
        
        readStudentsInfoPListFile()
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return colorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellColors")
   
        cell?.textLabel?.text = self.colorsArray[indexPath.row]
    
        return cell!
    }
    
    
    func readStudentsInfoPListFile(){
        
        let plist = Bundle.main.path(forResource: "StudentInfo", ofType: "plist")
        
        //        print(plist)
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let colors = dict["colors"] as? [String]
            {
                self.colorsArray += colors
                 self.colorTableView.reloadData()
            }
        }

}

}
