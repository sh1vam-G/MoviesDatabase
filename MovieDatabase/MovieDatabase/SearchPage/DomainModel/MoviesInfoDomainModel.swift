//
//  MoviesInfoDomainModel.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 05/08/24.
//

import Foundation

class MoviesInfoDomainModel {
    var title: String? // "Meet the Parents", ****************************
    var year: String? // "2000", ****************************
    var genre: String? // "Comedy, Romance", ****************************
    var director: String? // "Jay Roach", ****************************
    var writer: String? // "Greg Glienna, Maryrg (screenplay)", ****************************
    var actors: String? // "Robert De Niro, Ben Stiller, Teri Polo, Blythe Danner", ***********************
    var plot: String? // "A Jewish male nurse pla.", ****************************
    var language: String? // "English, Thai, Spanish, Hebrew, French", ****************************
    var poster: String? // "https://m.med",  ****************************
    var ratings: [MovieRatingsDomainModel]? //****************************
    var imdbRating: String? // "7.0", ****************************
    var imdbVotes: String? // "310,464", ****************************
    var imdbID: String? // "tt0212338", ****************************
//    var production: String? // "Nancy Tenenbaum Productions, Universal Pictures, Tr // ******************
    
    init(
        title: String?,
        year: String?,
        genre: String?,
        director: String?,
        writer: String?,
        actors: String?,
        plot: String?,
        language: String?,
        poster: String?,
        ratings: [MovieRatingsDomainModel]?,
        imdbRating: String?,
        imdbVotes: String?,
        imdbID: String? //,
//        production: String?
    ) {
        self.title = title
        self.year = year
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.poster = poster
        self.ratings = ratings
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        self.imdbID = imdbID
//        self.production = production
    }
}

class MovieRatingsDomainModel {
    var source: String? // "Metacritic",
    var value: String? // "73/100"
    
    init(
        source: String?,
        value: String?
    ) {
        self.source = source
        self.value = value
    }
}
