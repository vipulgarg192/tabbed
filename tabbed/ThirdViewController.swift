//
//  ThirdViewController.swift
//  tabbed
//
//  Created by MacStudent on 2019-07-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
  

    var studentDict = [StudentStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        readStudentsInfoPListFile()
        // Do any additional setup after loading the view.
    }
    
    func readStudentsInfoPListFile(){
        
        let plist = Bundle.main.path(forResource: "StudentInfo", ofType: "plist")
        
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let colors = dict["colors"] as? [String]
            {
                print(colors)
            }
        }
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let colors = dict["students"] as? [[String:Any]]
            {
                print(colors)
                
                for item in colors {
                    let city = item["city"] as! String
                    let studentName = item["studentName"] as! String
                    let studentId = item["studentId"] as! Int
                    
                  self.studentDict.append(StudentStruct(studentId: studentId, studentName:studentName, city: city))
                }
                
            }
        }
     
       
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
