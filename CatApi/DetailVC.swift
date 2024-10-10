//
//  DetailVC.swift
//  CatApi
//
//  Created by Admin on 09/10/24.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var width: UILabel!
    @IBOutlet weak var height: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cat: String = UserDefaults.standard.value(forKey: "SelectedCat") as! String
        let cat1: String = UserDefaults.standard.value(forKey: "SelectedCat1") as! String
        let cat2: Int = UserDefaults.standard.value(forKey: "SelectedCat2") as! Int
        let cat3: Int = UserDefaults.standard.value(forKey: "SelectedCat3") as! Int
        id.text = cat
        url.text = cat1
        width.text = String(cat2)
        height.text = String(cat3)
    }
}
