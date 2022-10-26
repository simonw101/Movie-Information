//
//  ViewController.swift
//  Movie Information
//
//  Created by Simon Wilson on 22/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func findFilmButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMovieDetailsVC", sender: nil)
        
        titleTextField.text = ""
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieDetailsVC" {
            
            let destinationVC = segue.destination as! MovieDetailViewController
            if let title = titleTextField.text {
                destinationVC.filmTitle = title
            }
            
        }
    }
    
}

