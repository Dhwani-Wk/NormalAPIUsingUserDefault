//
//  ViewController.swift
//  CatApi
//
//  Created by Admin on 09/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    private var catArr: [CatModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let usr = UserDefaults.standard.value(forKey: "UsrName")
        navigationItem.title = "Good Afternoon \(usr!)"
        getCat()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.setValue("Gujarat University", forKey: "UsrName")
        // Do any additional setup after loading the view.
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "CatCell", bundle: nil), forCellReuseIdentifier: "CatCell")
    }
    
    func reloadTable(){
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    func getCat(){
        let urlStr = "https://api.thecatapi.com/v1/images/search?limit=10"
        if let url = URL(string: urlStr) {

            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, responds, error in
                if let error = error{
                    print(error)
                    return
                }
                
                guard let receivedData = data else {
                    print ("Received Data Successfully")
                    return
                }
                
                do {
                    let cats = try JSONDecoder().decode([CatModel].self, from: receivedData)
                    self.catArr.append(contentsOf: cats)
                    self.reloadTable()
                }
                catch{
                    debugPrint("something went worng: \(error.localizedDescription)")
                }
            }
            dataTask.resume()
        } else {
            print("Invalid URL, please check URL and try again")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as! CatCell
        cell.idLable.text = catArr[indexPath.row].id
        cell.urlLable.text = catArr[indexPath.row].url
        cell.widthLable.text = String(catArr[indexPath.row].width)
        cell.heightLable.text = String(catArr[indexPath.row].height)
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCat = catArr[indexPath.row]
        UserDefaults.standard.set(currentCat.id, forKey: "SelectedCat")
        UserDefaults.standard.set(currentCat.url, forKey: "SelectedCat1")
        UserDefaults.standard.set(currentCat.width, forKey: "SelectedCat2")
        UserDefaults.standard.set(currentCat.height, forKey: "SelectedCat3")
        performSegue(withIdentifier: "GoToNext", sender: self)
    }
}

