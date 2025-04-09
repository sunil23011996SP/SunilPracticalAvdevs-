//
//  CountryListViewController.swift
//  SunilPracticalAvdevs
//
//  Created by sunil prajapati on 09/04/25.
//

import UIKit
import iOSDropDown
import Kingfisher


class CountryListViewController: UIViewController {

    @IBOutlet weak var tvCountryList: UITableView!
    @IBOutlet weak var sortDropdown : DropDown!
    @IBOutlet var searchBar: UISearchBar!


    var arrCountryList : [CountryElement] = []
    let dataRepository = DataRepository()
    var currentAnimalArray : [CountryElement] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvCountryList.dataSource = self
        tvCountryList.delegate = self
        
        searchBar.delegate = self
        searchBar.placeholder = "Enter Country Name"
        
        let nib = UINib(nibName: "CountryListTableViewCell", bundle: nil)
        tvCountryList.register(nib, forCellReuseIdentifier: "CountryListTableViewCell")
        self.navigationController?.navigationBar.isHidden = true
        
        setupSortDropdown()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //web API GET service called
        webAPIServiceCalled()
    }
}

//MARK: - Custom Method
extension CountryListViewController{
    //create method for setup sort dropdown
    func setupSortDropdown(){
        //setup sort
        self.sortDropdown.listHeight = 220
        self.sortDropdown.optionArray = ["Name (A-Z)","Capital (A-Z)","Population"]
        
        self.sortDropdown.isSearchEnable = false
        self.sortDropdown.checkMarkEnabled = true
        
        self.sortDropdown.selectedRowColor = UIColor.lightGray
        
        sortDropdown.didSelect { selectedText, index, id in
            //dropdown selected value
            if index == 0{
                //selected name
                self.currentAnimalArray.sort { $0.name.common < $1.name.common}
            }
            else if index == 1{
                //selected capital
                self.currentAnimalArray.sort { $0.capital.first ?? "" < $1.capital.first ?? ""}

                
            }
            else if index == 2{
                //selected polulation
                self.currentAnimalArray.sort { $0.population > $1.population }
            }
            
            self.tvCountryList.reloadData()
            print("Selected String: \(selectedText) \n index: \(index) \n Id: \(id)")
        }
    }
    
}


// MARK: - UITableview Cell DataSource and Delegate Method
extension CountryListViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentAnimalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryListTableViewCell", for: indexPath) as! CountryListTableViewCell
                
        let url = URL(string: currentAnimalArray[indexPath.row].flags.png)
        cell.imgFlag.kf.setImage(with: url)
        
        cell.lblName.text = "Country Name: \(currentAnimalArray[indexPath.row].name.common)"
        
        cell.lblPopulation.text = "Population: \(currentAnimalArray[indexPath.row].population)"
        
        cell.lblCapital.text = "Capital: \(currentAnimalArray[indexPath.row].capital.first ?? "")"
        
        cell.lblCurrency.text = "Currency: \(currentAnimalArray[indexPath.row].currencies.first?.value.name ?? "") (\(currentAnimalArray[indexPath.row].currencies.first?.value.symbol ?? ""))"
     
          return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //show detail view
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CountryDetailViewController") as!  CountryDetailViewController
        vc.objCountryElement = arrCountryList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

// MARK: - UISearchbar Delegate Method
extension CountryListViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 3
        {
            currentAnimalArray = arrCountryList.filter({ animal -> Bool in
                return animal.name.common.lowercased().contains(searchText.lowercased())
            })
            tvCountryList.reloadData()
        }
        else{
            currentAnimalArray.removeAll()
            currentAnimalArray = arrCountryList
            tvCountryList.reloadData()
        }
    }
}


//Webservice API calling
extension CountryListViewController {
    
    func webAPIServiceCalled(){
        self.dataRepository.CountryList { (status, resposne, err) in
            DispatchQueue.main.async {
                if resposne != nil{
                    self.arrCountryList = resposne!
                    self.currentAnimalArray = self.arrCountryList
                    print("arrray value",self.arrCountryList)
                }
                self.tvCountryList.reloadData()
                
            }
            
        }
        
    }
    
    
}

