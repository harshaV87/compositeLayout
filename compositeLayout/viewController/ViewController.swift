//
//  ViewController.swift
//  compositeLayout
//
//  Created by Venkata harsha Balla on 8/6/20.
//  Copyright © 2020 BVH. All rights reserved.
//

import UIKit

private let reuseID = "cell"

class ViewController: UIViewController {
    
    
    // Instantiating the model
    
    private var models = [cellModal]()
    
    
    // creating a tableview with a grouped style
    
    private let table: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        
        // registering the cell
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: reuseID)
        
        // registering the newtable view
        
        table.register(TableViewCellWithColView.self, forCellReuseIdentifier: TableViewCellWithColView.identifier)
        
        return table
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding the table to the view and setting up the data source and delegate
        view.addSubview(table)
        
        table.dataSource = self
        table.delegate = self
        
        modelCreation()
        
            }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // making the table view the whole screen
        table.frame = view.bounds
        
    }
    
    
    // MARK: Models creation - The data from the API needs to be parsed and then given off to the model to display it to the view - but here I have dummy data , just to create a model of the layout
    
    func modelCreation() {
        
        models.append(.collectionView(models: [collectionTableCellM(title: "C8 1", imageView: "car1"), collectionTableCellM(title: "C8 2", imageView: "car2"), collectionTableCellM(title: "C8 3", imageView: "car3")], rows: 2 ))
        
        models.append(.list(models: [ListCellM(title: "C1"), ListCellM(title: "C2")]))
        
        
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    // tableview aspects
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch models[section] {
            
        case .collectionView( _, _): return 1
            
        case .list(let models): return models.count
        
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        switch models[indexPath.section] {
        case .collectionView(let models, _):
            // here we are working with the tableview
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellWithColView.identifier, for: indexPath) as! TableViewCellWithColView
            
            cell.configure(with: models)
            cell.delegate = self
            
            return cell
            
            
        case .list(let models):
            // here just the list view
            
            let model = models[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
            
            cell.textLabel?.text = model.title
            
            return cell
            
        }
        
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("didselectNormalListitem")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return models.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        

        switch models[indexPath.section] {
        case .collectionView(_, let rows):
            return CGFloat(180 * rows)
        case .list(_):
            return 50
        }

    }
    
}

extension ViewController: CollectionTableViewCellDelegate {
    func didSelectItem(with model: collectionTableCellM) {
        print("selected \(model.title)")
    }

}
