//
//  SaveMovieViewController.swift
//  MovieApp
//
//  Created by Sin Yan on 16/3/22.
//

import UIKit

class SaveMovieViewController: UIViewController {
    
    var movie: Movie?

//    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        // Validate to ensure that all the fields are entered by the user. If not we show an alert.
        if
            nameTextField.text == "" ||
            descTextView.text == "" ||
            imageTextField.text == "" ||
            ratingTextField.text == ""
        {
            let alert = UIAlertController(
                title: "Please enter all fields",
                message: "",
                preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
            
        }
        
        // validate image url
        let url = URL(string: imageTextField.text!)!
        if (try? Data(contentsOf: url)) == nil {
            let alert = UIAlertController(
                title: "Invalid Image URL",
                message: "",
                preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            
            self.present(alert,animated: true, completion: nil)
            return
        }
        
        if let movieItem = movie {
            let isNew = movieItem.id == ""
            
            // assign the data entered by the user into the movie object
//            movieItem.id = idTextField.text!
            movieItem.name = nameTextField.text!
            movieItem.desc = descTextView.text!
            movieItem.image = imageTextField.text!
            
            let rating = Int(ratingTextField.text!)
            movieItem.rating = rating != nil ? rating! : 0
            
            // add or updtate movie
            if (isNew) {
                DataManager.addMovie(movie: movieItem)
            }
            else {
                DataManager.updateMovie(movie: movieItem)
            }
            
            // close this view controller and pop back out to the one that shows the list of movies
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let movieItem = movie {
            let isNew = movieItem.id == ""
            title = isNew ? "Add Movie" : "Edit Movie"
//            idTextField.isEnabled = isNew
            
//            idTextField.text = movieItem.id
            nameTextField.text = movieItem.name
            ratingTextField.text = "\(movieItem.rating)"
            imageTextField.text = movieItem.image
            descTextView.text = movieItem.desc
        }
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
