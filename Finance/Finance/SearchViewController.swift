//
//  SearchViewController.swift
//  Finance
//
//  Created by Steven Solo on 12/12/22.
//

import UIKit
import PolygonioSwift
import SDWebImage

class SearchViewController: UIViewController {

    
    var receivedString = ""
    let polygon = PolygonioSwift.Client(key: "7iB1JD_bxYO6wj7lQdXLsuPDhcMUup3W")
    
    @IBOutlet weak var CompName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var PercentChange: UILabel!
    @IBOutlet weak var OpenPrice: UILabel!
    @IBOutlet weak var ClosePrice: UILabel!
    @IBOutlet weak var HighPrice: UILabel!
    @IBOutlet weak var MarketCap: UILabel!
    @IBOutlet weak var Volume: UILabel!
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var compLogo: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(receivedString)
        
        polygon.tickerDetails(symbol: "\(receivedString)") { [self]
            (result: TickerDetailsResponse?, error) in print(result?.logo ?? "")
            self.CompName.text = "\(result?.name ?? "Not Found")"
            

            compLogo.sd_setImage(with: URL(string: "\(result?.logo ?? "")"), placeholderImage: UIImage(named: "placeholder.png"))
            MarketCap.text = "\(result?.marketcap ?? 0)"
            Description.text = "\(result?.description ?? "")"
            
            
        }
        
        polygon.tickerSnapshot(symbol: "\(receivedString)") { [self]  (result:TickerSnapshotResponse?, err) in
                
            if (result?.ticker.todaysChange ?? 1 < 1){
                price.textColor = UIColor.red
            }
            else{
                price.textColor = UIColor.green
            }
            price.text = "\(result?.ticker.min.VWAP ?? 0)"
            PercentChange.text = "\(result?.ticker.todaysChangePerc ?? 0)"
            OpenPrice.text = "\(result?.ticker.day.open ?? 0)"
            ClosePrice.text = "\(result?.ticker.prevDay.close ?? 0)"
            HighPrice.text = "\(result?.ticker.day.high ?? 0)"
            Volume.text = "\(result?.ticker.day.volume ?? 0)"
                
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

}
