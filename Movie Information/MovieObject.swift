//
//  MovieObject.swift
//  Movie Information
//
//  Created by Simon Wilson on 14/09/2022.
//

import Foundation

struct MovieObject {
    
    var title: String
    var year: String
    var rating: String
    var releaseDate: String
    var runtime: String
    var genre: String
    var director: String
    var writer: String
    var actors: String
    var plot: String
    var languages: String
    var country: String
    var awards: String
    var poster: String
    var imdbRating: String
    var type: String
    var dvdRelease: String
    var boxOffice: String
    var production: String
    var website: String
    var response: String
    
    init(title: String, year: String, rating: String, releaseDate: String, runTime: String, genre: String, director: String, writer: String, actors: String, plot: String, languagesForFilm: String, country: String, awards: String, poster: String, imdbRating: String,type: String, dvdRelease: String, boxOffice: String, production: String, website: String, response: String) {
        self.title = title
        self.year = year
        self.rating = rating
        self.releaseDate = releaseDate
        self.runtime = runTime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.languages = languagesForFilm
        self.country = country
        self.awards = awards
        self.poster = poster
        self.imdbRating = imdbRating
        self.type = type
        self.dvdRelease = dvdRelease
        self.boxOffice = boxOffice
        self.production = production
        self.website = website
        self.response = response
        
    }
    
    
    
}

