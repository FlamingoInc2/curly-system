//
//  StocksViewController.swift
//  Finance
//
//  Created by Steven Solo on 11/28/22.
//

import UIKit
import Parse
import PolygonioSwift

class StocksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let polygon = PolygonioSwift.Client(key: "7iB1JD_bxYO6wj7lQdXLsuPDhcMUup3W")

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    
        polygon.aggregates(ticker: "AAPL", multiplier: 1, timespan: .day, from: "2022-12-05", to: "2022-12-05") { (result:AggregatesResponse?, err) in
            // check if we got any errors
            if let err = err {
                print(err)
            } else {
                print(result?.results)
                print("***************************\n")
                print(result?.results[0].open as Any)

                
            }
        }
        
    /*
        polygon.tickerSnapshot(symbol: "AAPL") { (result:TickerSnapshotResponse?, err) in
            print(result?.ticker.day.high)
            print(result?.ticker.todaysChange)
        }

        
        

        polygon.tickerDetails(symbol: "AAPL") { (result:TickerDetailsResponse?, err) in
            // check if we got any errors
            if let err = err {
                print(err)
            } else {
                print(result?.marketcap)
            }
        } */
 
 }


    //This is how many cells??
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockTableViewCell") as! StockTableViewCell
        
        polygon.tickerSnapshot(symbol: "AAPL") { (result:TickerSnapshotResponse?, err) in

            cell.currentPrice.text = "\(result?.ticker.min.VWAP ?? 0)"
        }
        
        return cell
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let
                delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
    }
    
}
