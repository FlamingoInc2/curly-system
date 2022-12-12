//
//  StocksViewController.swift
//  Finance
//
//  Created by Steven Solo on 11/28/22.
//

import UIKit
import Parse
import PolygonioSwift
import SDWebImage




class StocksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let polygon = PolygonioSwift.Client(key: "7iB1JD_bxYO6wj7lQdXLsuPDhcMUup3W")
    let inputSymbols = ["AAPL", "AMZN", "BAC", "BBBY", "COST", "CRM", "DIS", "FANG", "HAL", "HPE", "HZNP", "IBM", "IEP", "IIPR", "INTC", "IOVA", "JAGX", "JAZZ", "JBLU", "JBSS", "JKS", "KMI", "KO", "MMM", "MRVL", "NKE", "NFLX", "ORCL", "OXY", "PEP", "PYPL", "ROKU", "SBUX", "SHOP", "TSLA", "TSM"]
    
    
    @IBOutlet weak var searchController: UISearchBar!
    
    func setupSearchBar () {
        searchController.delegate = self
        
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 36
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockTableViewCell") as! StockTableViewCell
        
        polygon.tickerSnapshot(symbol: "\(inputSymbols[indexPath.row])") {  (result:TickerSnapshotResponse?, err) in
                
            cell.currentPrice.text = "\(result?.ticker.min.VWAP ?? 0)"
                
        }
        polygon.tickerDetails(symbol: "\(inputSymbols[indexPath.row])") {
            (result: TickerDetailsResponse?, error) in print(result?.logo ?? "")
            cell.CompName.text = "\(result?.name ?? "na")"
            

            cell.compLogo.sd_setImage(with: URL(string: "\(result?.logo ?? "")"), placeholderImage: UIImage(named: "placeholder.png"))
            
        }
    
          /* TO ADD LOGO
           polygon.tickerDetails(symbol: <#T##String#>) {(result:TickerDetailsResponse?, error) in
                cell.
                result?.logo
            } */
            return cell
        }
        
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
                print("***************************\n")
                print(result?.results[0].open as Any)
            }
        }
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
                                                    
                                                    
                
                                                
                                                    

        
