//
//  ViewController.swift
//  TableViewStudy
//
//  Created by Ömer Faruk Kılıçaslan on 27.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var landmarkNames = [String]()
    
    var landmarkImages = [UIImage]()
    
    var chosenLandMarkNames = ""
    var chosenLandMarkImages = UIImage()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegatesTableView()
        
        
        
        landmarkNames.append("First")
        landmarkNames.append("Second")
        landmarkNames.append("Third")
        landmarkNames.append("Fourth")
        
        landmarkImages.append(UIImage(named: "img1")!)
        landmarkImages.append(UIImage(named: "img2")!)
        landmarkImages.append(UIImage(named: "img3")!)
        landmarkImages.append(UIImage(named: "img4")!)

    }
    
    func setDelegatesTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.titleL = chosenLandMarkNames
            destinationVC.imageView = chosenLandMarkImages
        }
    }


}

extension ViewController: UITableViewDelegate,  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return landmarkNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         chosenLandMarkNames = landmarkNames[indexPath.row]
         chosenLandMarkImages = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
