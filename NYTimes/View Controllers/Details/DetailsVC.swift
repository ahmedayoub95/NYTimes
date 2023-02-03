//
//  DetailsVC.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//

import UIKit

class DetailsVC: UIViewController {

    
    @IBOutlet weak var detailsLbl: UILabel!
    var details:String = ""
    var date:String = ""
    var titles:String = ""
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async { [self] in
            titleLbl.text = titles
            detailsLbl.text = details
            dateLbl.text = date
        }
        // Do any additional setup after loading the view.
    }
    

}
