//
//  SearchViewController.swift
//  Finance
//
//  Created by Steven Solo on 12/12/22.
//

import UIKit
import PolygonioSwift

class SearchViewController: UIViewController {

    
    var receivedString = ""
    let polygon = PolygonioSwift.Client(key: "7iB1JD_bxYO6wj7lQdXLsuPDhcMUup3W")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(receivedString)
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
