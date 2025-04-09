//
//  CountryDetailViewController.swift
//  SunilPracticalAvdevs
//
//  Created by sunil prajapati on 09/04/25.
//

import UIKit

class CountryDetailViewController: UIViewController {

    var objCountryElement : CountryElement?
    
    let ArrBorderCountry = ["AFG","KAZ","KGZ","TJK","TKM"]
    
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblPopulation: UILabel!
    @IBOutlet weak var lblCapital: UILabel!
    @IBOutlet weak var lblRegion: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var tvBorderCountryList: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvBorderCountryList.dataSource = self
        tvBorderCountryList.delegate = self
       
        let nib = UINib(nibName: "BorderCountryTableViewCell", bundle: nil)
        tvBorderCountryList.register(nib, forCellReuseIdentifier: "BorderCountryTableViewCell")
        self.navigationController?.navigationBar.isHidden = true
        
        //setup detail data
        setupCountryDetailData()
    }
    
    
    //MARK: - Setup Country Detail Data
    func setupCountryDetailData(){
        
        lblCountryName.text = "Country Name: \(objCountryElement?.name.common ?? "")"
        lblPopulation.text = "Population: \(objCountryElement?.population ?? 0)"
        lblCapital.text = "Capital: \(objCountryElement?.capital.first ?? "")"
        lblRegion.text = "Region: \(objCountryElement?.region ?? "")"
        lblCurrency.text = "Currency: \(objCountryElement?.currencies.first?.value.name ?? "") (\(objCountryElement?.currencies.first?.value.symbol ?? ""))"
        
//        
//        let red = "red"
//        let blue = "blue"
//        let green = "green"
//        let stringValue = "\(red) \(blue) \(green)"
//        lblCountryName.textColor = UIColor.lightGray
//        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
//
//        attributedString.setColor(color: UIColor.red, forText: red)   // or use direct value for text "red"
//        attributedString.setColor(color: UIColor.blue, forText: blue)   // or use direct value for text "blue"
//        attributedString.setColor(color: UIColor.green, forText: green)   // or use direct value for text "green"
//        lblCountryName.font = UIFont.systemFont(ofSize: 26)
//        lblCountryName.attributedText = attributedString
        
        
    }
    
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    

}

// MARK: - UITableview Cell DataSource and Delegate Method
extension CountryDetailViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrBorderCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BorderCountryTableViewCell", for: indexPath) as! BorderCountryTableViewCell
        
        cell.lblName.text = "• \(ArrBorderCountry[indexPath.row])"

     
          return cell
    }
    
    
    
}
