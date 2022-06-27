//
//  SecondViewController.swift
//  TableViewStudy
//
//  Created by Ömer Faruk Kılıçaslan on 27.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var imageView = UIImage()
    var titleL = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleL
        photoImageView.image = imageView
    }
    

    
}
