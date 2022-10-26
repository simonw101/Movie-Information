//
//  MovieDetailViewController.swift
//  Movie Information
//
//  Created by Simon Wilson on 22/06/2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var scImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //variables
    var filmTitle: String? = nil
    
    //lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let title = filmTitle {
            
            let titleString = title.replacingOccurrences(of: " ", with: "+")
            
            downloadData(title: titleString)
            
        }
        
    }
    
    func downloadData(title: String) {
        AF.request("https://www.omdbapi.com/?t=\(title)&plot=full&apikey=bb9532df").response { response in
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                let title = json["Title"].stringValue
                let year = json["Year"].stringValue
                let rated = json["Rated"].stringValue
                let released = json["Released"].stringValue
                let runtime = json["Runtime"].stringValue
                let genre = json["Genre"].stringValue
                let director = json["Director"].stringValue
                let writer = json["Writer"].stringValue
                let actors = json["Actors"].stringValue
                let plot = json["Plot"].stringValue
                let languages = json["Language"].stringValue
                let country = json["Country"].stringValue
                let awards = json["Awards"].stringValue
                let poster = json["Poster"].stringValue
                let type = json["Type"].stringValue
                let dvd = json["DVD"].stringValue
                let boxoffice = json["BoxOffice"].stringValue
                let production = json["Production"].stringValue
                let website = json["Website"].stringValue
                let response = json["Response"].stringValue
                var imdbRating = ""
                
                //ratings
                let ratings = json["Ratings"].arrayValue
                
                if response == "True" {
                    imdbRating = ratings[0]["Value"].stringValue
                    
                    let movie = MovieObject(title: title, year: year, rating: rated, releaseDate: released, runTime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, languagesForFilm: languages, country: country, awards: awards, poster: poster, imdbRating: imdbRating, type: type, dvdRelease: dvd, boxOffice: boxoffice, production: production, website: website, response: response)
                    
                    print(movie)
                    
                    
                    if let posterURL = URL(string: movie.poster) {
                        self.scImageView.kf.setImage(with: posterURL)
                        
                        self.titleLabel.text = movie.title
                    }
                    
                    
                } else {
                    makeAlert(title: "Error", message: "Cannot find Search query: Please try again")
                    
                }
            
            case .failure(let error):
                print(error)
            }
            
        }
        
        func makeAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { alert in
                self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(okButton)
            
            self.present(alert, animated: true)
            
            
        }
        
    }
    
    
    
}


