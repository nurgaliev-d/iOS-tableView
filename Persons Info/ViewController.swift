//
//  ViewController.swift
//  Persons Info
//
//  Created by Диас Нургалиев on 31.05.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSurname: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    var name = ""
    var surname = ""
    var info = ""
    var imagename = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelName.text = name
        labelSurname.text = surname
        labelInfo.text = info
        imageview.image = UIImage(named: imagename)
        
    }
    
}

