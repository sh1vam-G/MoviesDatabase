//
//  MoviesInfoDataModel.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 05/08/24.
//

import Foundation

class MoviesInfoDataModel: Codable {
    var title: String?
    var year: String?
    var rated: String?
    var released: String?
    var runtime: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var poster: String?
    var ratings: [MovieRatingsDataModel]?
    var metascore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var type: String?
    var dvd: String?
    var boxOffice: String?
    var production: String?
    var website: String?
    var response: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
    func getMovieDomainModel() -> MoviesInfoDomainModel {
        return MoviesInfoDomainModel(
            title: self.title,
            year: self.year,
            released: self.released,
            genre: self.genre,
            director: self.director,
            writer: self.writer,
            actors: self.actors,
            plot: self.plot,
            language: self.language,
            poster: self.poster,
            ratings: self.ratings?.map{ $0.getMovieRatingsDomainModel() },
            imdbRating: self.imdbID,
            imdbVotes: self.imdbVotes,
            imdbID: self.imdbID,
            type: self.type,
            production: self.production
        )
    }
}

class MovieRatingsDataModel: Codable {
    var source: String?
    var value: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
    
    func getMovieRatingsDomainModel() -> MovieRatingsDomainModel {
        return MovieRatingsDomainModel(source: self.source, value: self.value)
    }
}
