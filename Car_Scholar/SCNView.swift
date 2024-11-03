//
//  SCNView.swift
//  Car_Scholar
//
//  Created by Asaad Shaikh on 3/25/24.
//

import UIKit

class SCNView: UIViewController {
    var maintenanceData: String?
    var carMake: String? // Add this property to hold the car make

    @IBOutlet weak var finalview: UILabel!
    
    @IBOutlet weak var carimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Use the stored maintenanceData
        finalview.text = maintenanceData
        setCarImage()
        finalview.numberOfLines = 0 // Allow unlimited number of lines
        self.view.backgroundColor = UIColor.lightGray

    }
    func setCarImage() {
        guard let carMake = carMake else {
            return
        }
        let imageName = carMake
        carimage.image = UIImage(named: imageName)
    
    }

    
    func setup(maintInfo: String) {
        // Store the maintenance information
        DispatchQueue.main.async {
             self.finalview.text = maintInfo

        }
       

    }
}
