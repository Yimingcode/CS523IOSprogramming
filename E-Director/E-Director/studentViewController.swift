//
//  SettingsViewController.swift
//  E-Director
//
//  Created by 徐一鸣 on 3/10/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class studentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var fourthButton: UIButton!
    
    @IBOutlet weak var fifthButton: UIButton!
    
    var data: [String] = []
    var selectedRow: Int = -1
//    var fileURL:URL!
    var newRowText:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
        buttonAppearance()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        data.append("Student 1")
        data.append("Student 2")
        data.append("Student 3")
        self.title = "Student"
        self.navigationController?.navigationBar.prefersLargeTitles = true
         self.navigationItem.largeTitleDisplayMode = .always
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        
//        let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//        fileURL = baseURL.appendingPathComponent("students.txt")
        
        load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if selectedRow == -1 {
            return
        }
        data[selectedRow] = newRowText
        if newRowText == "" {
            data.remove(at: selectedRow)
        }
        
        tableView.reloadData()
        save()
    }
    
    
    @objc func addNote(){
        if tableView.isEditing{
            return
        }
        
        let name: String = ""
        data.insert(name, at: 0)
        let indexPath: IndexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
    
    
    
    func layoutViews(){
        
        var constraints = [NSLayoutConstraint]()
        
//        //MARK: titleLabel layout constraints
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        //titleLabel.top = view.safeAreaLayoutGuide.top
//        constraints += [NSLayoutConstraint.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
//        //titleLabel.centerX = view.centerX
//        constraints += [NSLayoutConstraint.init(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0)]
//        //titleLabel.bottom= scrollview.top
//        constraints += [NSLayoutConstraint.init(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: searchBar, attribute: .top, multiplier: 1.0, constant: -10.0)]
        
        //MARK: searchBar layout constraints
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        //searchBar.top
        constraints += [NSLayoutConstraint.init(item: searchBar, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
        //searchBar.leading = view.leading
        constraints += [NSLayoutConstraint.init(item: searchBar, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        //searchBar.trailing = view.trailing
        constraints += [NSLayoutConstraint.init(item: searchBar, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        //searchBar.bottom = tableView.top
        constraints += [NSLayoutConstraint.init(item: searchBar, attribute: .bottom, relatedBy: .equal, toItem: tableView, attribute: .top, multiplier: 1.0, constant: 0.0)]
        
        //MARK: tableView layout constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //searchBar.leading = view.leading
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        //tableView.trailing = view.trailing
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        //tableView.bottom = firstButton.top
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: firstButton, attribute: .top, multiplier: 1.0, constant: 0.0)]
        //width
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 10.0)]
        
        //MARK: firstButton layout constraints
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        //firstButton.leading = view.leading
        constraints += [NSLayoutConstraint.init(item: firstButton, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        //firstButton.bottom = view.bottom
        constraints += [NSLayoutConstraint.init(item: firstButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]
        //firstButton.trailing
        constraints += [NSLayoutConstraint.init(item: firstButton, attribute: .trailing, relatedBy: .equal, toItem: secondButton, attribute: .leading, multiplier: 1.0, constant: -10.0)]
        //firstButton.height = 0.05 * view
        constraints += [NSLayoutConstraint.init(item: firstButton, attribute: .height, relatedBy: .lessThanOrEqual, toItem: view, attribute: .height, multiplier: 0.05, constant: 0.0)]
        
        
        //MARK: secondButton layout constraints
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        //secondButton.firstBaseline = firstButton.firstBaseline
        constraints += [NSLayoutConstraint.init(item: secondButton, attribute: .firstBaseline, relatedBy: .equal, toItem: firstButton, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0)]
        //secondButton.height = 0.05 * view
        constraints += [NSLayoutConstraint.init(item: secondButton, attribute: .height, relatedBy: .equal, toItem: firstButton, attribute: .height, multiplier: 1.0, constant: 0.0)]
        //width
        constraints += [NSLayoutConstraint.init(item: secondButton, attribute: .width, relatedBy: .equal, toItem: firstButton, attribute: .width, multiplier: 1.0, constant: 0.0)]
        //trailing
        constraints += [NSLayoutConstraint.init(item: secondButton, attribute: .trailing, relatedBy: .equal, toItem: thirdButton, attribute: .leading, multiplier: 1.0, constant: -10.0)]
        
        //MARK: thirdButton layout constraints
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        //thirdButton.centerX = view.centerX
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0)]
        //thirdButton.firstBaseline = firstButton.firstBaseline
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .firstBaseline, relatedBy: .equal, toItem: firstButton, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0)]
        //thirdButton.height = 0.05 * view
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .height, relatedBy: .equal, toItem: firstButton, attribute: .height, multiplier: 1.0, constant: 0.0)]
        //        //width
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .width, relatedBy: .equal, toItem: secondButton, attribute: .width, multiplier: 1.0, constant: 0.0)]
        //trailing
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .trailing, relatedBy: .equal, toItem: fourthButton, attribute: .leading, multiplier: 1.0, constant: -10.0)]
        
        
        //MARK: fourthButton layout constraints
        fourthButton.translatesAutoresizingMaskIntoConstraints = false
        //fourthButton.trailing = fifthButton.leading
        constraints += [NSLayoutConstraint.init(item: fourthButton, attribute: .trailing, relatedBy: .equal, toItem: fifthButton, attribute: .leading, multiplier: 1.0, constant: -10.0)]
        //fourthButton.firstBaseline = firstButton.firstBaseline
        constraints += [NSLayoutConstraint.init(item: fourthButton, attribute: .firstBaseline, relatedBy: .equal, toItem: firstButton, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0)]
        //fourthButton.height = 0.05 * view
        constraints += [NSLayoutConstraint.init(item: fourthButton, attribute: .height, relatedBy: .equal, toItem: firstButton, attribute: .height, multiplier: 1.0, constant: 0.0)]
        //width
        constraints += [NSLayoutConstraint.init(item: fourthButton, attribute: .width, relatedBy: .equal, toItem: thirdButton, attribute: .width, multiplier: 1.0, constant: 0.0)]
        
        
        //MARK: fifthButton layout constraints
        fifthButton.translatesAutoresizingMaskIntoConstraints = false
        //fifthButton.trailing = view.trailing
        constraints += [NSLayoutConstraint.init(item: fifthButton, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        //fifthButton.firstBaseline = firstButton.firstBaseline
        constraints += [NSLayoutConstraint.init(item: fifthButton, attribute: .firstBaseline, relatedBy: .equal, toItem: firstButton, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0)]
        //fifthButton.height = 0.05 * view
        constraints += [NSLayoutConstraint.init(item: fifthButton, attribute: .height, relatedBy: .equal, toItem: firstButton, attribute: .height, multiplier: 1.0, constant: 0.0)]
        //fifthButton.width = fourthButton.width
        constraints += [NSLayoutConstraint.init(item: fifthButton, attribute: .width, relatedBy: .equal, toItem: fourthButton, attribute: .width, multiplier: 1.0, constant: 0.0)]
        
        view.addConstraints(constraints)
        
    }
    //settings for the appearance of bottom buttons
    func buttonAppearance(){

        firstButton.backgroundColor = UIColor.lightGray
        //        firstButton.setTitle("Statistics", for: UIControl.State.normal)
        
        
        
        secondButton.backgroundColor = UIColor.lightGray
        //        secondButton.setTitle("Class", for: UIControl.State.normal)
        
        thirdButton.backgroundColor = UIColor.lightGray
        //        thirdButton.setTitle("Schedule", for: UIControl.State.normal)
        
        fourthButton.backgroundColor = UIColor.lightGray
        //        fourthButton.setTitle("Stud", for: UIControl.State.normal)
        
        fifthButton.backgroundColor = UIColor.lightGray
        //        fifthButton.setTitle("Settings", for: UIControl.State.normal)
        
        firstButton.setTitle("Selected", for: UIControl.State.selected)
        firstButton.setTitleColor(UIColor.lightGray, for: UIControl.State.selected)
        secondButton.setTitle("Selected", for: UIControl.State.selected)
        thirdButton.setTitle("Selected", for: UIControl.State.selected)
        fourthButton.setTitle("Selected", for: UIControl.State.selected)
        fifthButton.setTitle("Selected", for: UIControl.State.selected)
        
        //        self.performSegue(withIdentifier: "showView", sender: firstButton)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "studentCell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        save()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any! ) {
        let detailView: DetailStudentViewController = segue.destination as! DetailStudentViewController
        selectedRow = tableView.indexPathForSelectedRow!.row
        detailView.masterView = self
        detailView.setText(t: data[selectedRow])
        
    }
    
    
    
    func save() {
        UserDefaults.standard.set(data, forKey: "students")
       
        
    }
    
    func load() {
        if let loadedData:[String] = UserDefaults.standard.value(forKey: "students") as? [String] {
            data = loadedData
            tableView.reloadData()
            
            
        }
        
        
    }
    
    
    
    
}
