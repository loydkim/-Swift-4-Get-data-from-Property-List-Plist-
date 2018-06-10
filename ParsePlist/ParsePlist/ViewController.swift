//
//  ViewController.swift
//  ParsePlist
//
//  Created by YOUNGSIC KIM on 2018-06-09.
//  Copyright © 2018 YOUNGSIC KIM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private var titleValueArray: NSArray!
    private var subTitleArray: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get dicRoot
        
        let dicRoot = NSDictionary.init(contentsOfFile: Bundle.main.path(forResource: "test", ofType: "plist")!)
        let titleArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "Title") as Any)
        titleValueArray = titleArrayFromDic.object(at: 0) as! NSArray
        
        let subTitleArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "SubTitle") as Any)
        subTitleArray = subTitleArrayFromDic.object(at: 0) as! NSArray
        
        for count in 0..<titleValueArray.count {
            print(titleValueArray[count])
            print(subTitleArray[count])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleValueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "testCell")!
        cell.textLabel?.text = titleValueArray[indexPath.row] as? String
        cell.detailTextLabel?.text = subTitleArray[indexPath.row] as? String
        return cell
    }}

