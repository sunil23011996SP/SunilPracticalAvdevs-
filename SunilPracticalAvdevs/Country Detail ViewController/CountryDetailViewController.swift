//
//  CountryDetailViewController.swift
//  SunilPracticalAvdevs
//
//  Created by sunil prajapati on 09/04/25.
//

import UIKit

class CountryDetailViewController: UIViewController {

    var objCountryElement : CountryElement?
    
    
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

        self.lblCountryName.attributedText = AppData.setLabelMultipleColor(firstText: "Country Name: ", secondText: "\(objCountryElement?.name.common ?? "")", firstColor: UIColor.blue, secondColor: UIColor.black)
        
        self.lblPopulation.attributedText = AppData.setLabelMultipleColor(firstText: "Population: ", secondText: "\(objCountryElement?.population ?? 0)", firstColor: UIColor.blue, secondColor: UIColor.black)
        
        self.lblCapital.attributedText = AppData.setLabelMultipleColor(firstText: "Capital: ", secondText: "\(objCountryElement?.capital.first ?? "")", firstColor: UIColor.blue, secondColor: UIColor.black)
        
        self.lblRegion.attributedText = AppData.setLabelMultipleColor(firstText: "Region: ", secondText: "\(objCountryElement?.region ?? "")", firstColor: UIColor.blue, secondColor: UIColor.black)
        
        self.lblCurrency.attributedText = AppData.setLabelMultipleColor(firstText: "Capital: ", secondText: "\(objCountryElement?.currencies.first?.value.name ?? "") (\(objCountryElement?.currencies.first?.value.symbol ?? ""))", firstColor: UIColor.blue, secondColor: UIColor.black)
        
        
        
    }
    
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    

}

// MARK: - UITableview Cell DataSource and Delegate Method
extension CountryDetailViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objCountryElement?.borders.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BorderCountryTableViewCell", for: indexPath) as! BorderCountryTableViewCell
        
        cell.lblName.text = "• \(objCountryElement?.borders[indexPath.row] ?? "")"

     
          return cell
    }
    
    
    
}
