//
//  DetailsViewController.swift
//  Infinnovation Stock Exchange Simulator
//
//  Created by SwG Ghosh on 03/04/17.
//  Copyright © 2017 infinnovation. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var stocks: [DetailedStockItem] = [DetailedStockItem(name: "Bajaj", current: 450, difference: -12, percentage: -1.25, sector: "Automotive", profile: "Bajaj Auto Limited is an Indian two-wheeler and three-wheeler manufacturing company. Bajaj Auto manufactures and sells motorcycles, scooters andauto rickshaws. Bajaj Auto is a part of the Bajaj Group.", pclose: 900, ovalue: 900, lcircuit: 900, ucircuit: 900, dividend: 900, bvalue: 20), DetailedStockItem(name: "Mahindra", current: 450, difference: 12, percentage: 1.25, sector: "Automotive", profile: "Bajaj Auto Limited is an Indian two-wheeler and three-wheeler manufacturing company. Bajaj Auto manufactures and sells motorcycles, scooters andauto rickshaws. Bajaj Auto is a part of the Bajaj Group.", pclose: 900, ovalue: 900, lcircuit: 900, ucircuit: 900, dividend: 900, bvalue: 20)]
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activity.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Conforms to the UITableViewDataSource protocol
        var cell: UITableViewCell
        cell = getDetailedStockCell(tableView, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func getDetailedStockCell(_ tableView: UITableView, index: Int) -> DetailedStockTableViewCell {
        let cellIdentifier = "Detail"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! DetailedStockTableViewCell
        
        let stock = stocks[index]
        var triangle = "▼"
        
        cell.difference.textColor = .red
        
        if(stock.gain) {
            cell.difference.textColor = .green
            triangle = "▲"
        }
        
        cell.name.text = stock.name
        cell.current.text = "₹\(stock.current)"
        cell.difference.text = "\(triangle) ₹\(stock.difference)"
        cell.percentage.text = "\(stock.percentage)%"
        cell.profile.text = "\(stock.profile)"
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}