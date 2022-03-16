//
//  ProfileViewController.swift
//  MovieApp
//
//  Created by Sin Yan on 14/3/22.
//

import UIKit

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet weak var pickerView: UIPickerView!
    
    // This function is triggered when the user clicks on the button that this function is connected to.
    //
    @IBAction func buttonPressed(_ sender: Any) {
        
        // Here, find out which row in the 1st component was selected by the user.
        //
        let row = pickerView.selectedRow(inComponent: 0)
        
        // Then, we get the actual data from our pickerData array.
        //
        let selectedText = pickerData[row]
        
        // Then, we show an alert with the selected data.
        //
        let uiAlert = UIAlertController(
            title: "You selected \(selectedText)",
            message: "Thank you",
            preferredStyle: .alert)
        
        uiAlert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil))
        
        // After configuring the alert controller, you must present it like this:
        //
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    // This function is one of the functions that a delegate for the UIPickerDataSource should implement.
    // It tells the UIPicker how many components (vertical slots) there are in the list to display.
    //
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    // This function is one of the functions that a delegate for the UIPickerViewDataSource should implement.
    // It tells the UIPicker how many items in the list to display for a given component (vertical slot).
    // Since we only have 1 section, this function will only be called where the numberOfRowsComponent == 0.
    // We only need to return the number of items in the pickerData array.
    //
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    // Now, this is a function that should be implemented by a UIPickerViewDelegate delegate.
    // This simply tells the UIPickerView what to display in the contents for the given row/component of the picker.
    //
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Declare a string array that will contain the texts that we want to display in our picker view.
    //
    var pickerData : [String] = [
        "English",
        "Chinese",
        "Malay",
        "Tamil"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
