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
    

    @IBAction func searching(_ sender: Any) {
        self.performSegue(withIdentifier: "searchSeg", sender: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // Get a reference to the second view controller
        let secondViewController = segue.destination as! SearchViewController

        // Set a variable in the second view controller with the String to pass
        secondViewController.receivedString = textField.text!
    }
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 36
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockTableViewCell") as! StockTableViewCell
        
        polygon.tickerSnapshot(symbol: "\(inputSymbols[indexPath.row])") {  (result:TickerSnapshotResponse?, err) in
                
            if (result?.ticker.todaysChange ?? 1 < 1){
                cell.currentPrice.textColor = UIColor.red
            }
            else{
                cell.currentPrice.textColor = UIColor.green
            }
            
            cell.currentPrice.text = "\(result?.ticker.min.VWAP ?? 0)"
                
        }
        polygon.tickerDetails(symbol: "\(inputSymbols[indexPath.row])") {
            (result: TickerDetailsResponse?, error) in
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
                                                    
                                                    
                
                                                
                                                    

        
