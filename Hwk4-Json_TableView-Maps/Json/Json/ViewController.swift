//
//  ViewController.swift
//  Json
//
//  Created by 徐一鸣 on 3/4/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

struct heros: Decodable {
    let heroName: String
    let name: String
}

class ViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet weak var table: UITableView!
    
    let url = URL(string: "http://patrickhill.nyc/justiceleague.json")
    
    private var heros = [Hero]()

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
        table.dataSource = self
       
    }

    func downloadJSON () {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                return
            }
            do
            {
                let decoder = JSONDecoder()
                self.heros = try decoder.decode([Hero].self, from: data)
                
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
                
                
            } catch {
                
                print("somethings wrong")
            }
            
            
        }.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell") as? HeroCell else {return UITableViewCell() }
        cell.heroNamelabel.text = heros[indexPath.row].heroName
        cell.namelabel.text = heros[indexPath.row].name
        
        return cell
    }
    }



