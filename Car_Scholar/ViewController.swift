import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessage.text = "" // Ensure the label starts empty.

        errorMessage.numberOfLines = 0 // Allow the label to display multiple lines.
        
        

    }

    // This method is called when the shake gesture ends
       override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
           // Check if the motion is a shake motion
           if motion == .motionShake {
               // Clear the text field and error message
               inputBox.text = ""
               errorMessage.text = ""
           }
       }
    @IBOutlet weak var inputBox: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    let maintenanceData = [
        "Toyota": ["-Oil change every 5,000 miles", "-Check engine and cabin air filter every 10,000 miles", "-Change spark plugs every 120,000 miles", "-Change engine coolant every 60,000 miles"],
        "Nissan": ["-Oil change every 7500 miles", "-Check engine and cabin air filter every 10,000 miles", "-Change spark plugs every 30 to 60,000 miles", "-change fuel filter every 30,000 miles"],
        "Tesla": ["-Oil change every 7000 miles", "-Check engine and cabin air filter every 10,000 miles", "-Change spark plugs every 120,000 miles", "-Change engine coolant every 60,000 miles"],
        "BMW": ["-Oil change every 10000 miles", "-Check engine and cabin air filter every 10,000 miles", "-Change spark plugs every 120,000 miles", "-get rid of car after 60,000 miles"],
        "Chevrolet": ["-Oil change every 70000 miles", "-Check engine and cabin air filter every 10,000 miles", "-Change spark plugs every 120,000 miles", "-Change engine coolant every 60,000 miles"],
        // Add more car makes and maintenance items as needed
    ]
    
    @IBAction func enterButton(_ sender: Any) {
        
        errorMessage.text = ""
   
        guard let carMake = inputBox.text, !carMake.isEmpty else {
            return
        }

        guard let items = maintenanceData[carMake] else {
            errorMessage.text = ("Maintenance information not available for this car make. please ensure that you capitalize the first letter of the brand such as Toyota intead of toyota.")
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondController = storyboard.instantiateViewController(identifier: "SCNView") as? SCNView {
            secondController.carMake = carMake
            secondController.setup(maintInfo: items.joined(separator: " \n "))
            secondController.carMake = carMake
            errorMessage.text = ""
            self.present(secondController, animated: true, completion: nil)
     
        }
    }
}
