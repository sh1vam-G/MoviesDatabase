//
//  MoviesInfoDataModel.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 05/08/24.
//

import Foundation

class MoviesInfoDataModel: Codable {
    var title: String? // "Meet the Parents", ****************************
    var year: String? // "2000", ****************************
    var rated: String? // "PG-13",
    var released: String? // "06 Oct 2000",
    var runtime: String? // "108 min",
    var genre: String? // "Comedy, Romance", ****************************
    var director: String? // "Jay Roach", ****************************
    var writer: String? // "Greg Glienna, Maryrg (screenplay)", ****************************
    var actors: String? // "Robert De Niro, Ben Stiller, Teri Polo, Blythe Danner", ***********************
    var plot: String? // "A Jewish male nurse pla.", ****************************
    var language: String? // "English, Thai, Spanish, Hebrew, French", ****************************
    var country: String? // "USA",
    var awards: String? // "Nominated for 1 Oscar. Another 7 wins & 14 nominations.",
    var poster: String? // "https://m.med",  ****************************
    var ratings: [MovieRatingsDataModel]? //****************************
    var metascore: String? // "73",
    var imdbRating: String? // "7.0", ****************************
    var imdbVotes: String? // "310,464", ****************************
    var imdbID: String? // "tt0212338", ****************************
    var type: String? // "movie",
//    var dvd: String? // "N/A",
//    var boxOffice: String? // "$166,244,045",
//    var production: String? // "Nancy Tenenbaum Productions, Universal Pictures, Tr // ******************
//    var website: String? // "N/A",
    var response: String? // "True"
    
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
//        case dvd = "DVD"
//        case boxOffice = "BoxOffice"
//        case production = "Production"
//        case website = "Website"
        case response = "Response"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.year = try container.decode(String.self, forKey: .year)
        self.rated = try container.decode(String.self, forKey: .rated)
        self.released = try container.decode(String.self, forKey: .released)
        self.runtime = try container.decode(String.self, forKey: .runtime)
        self.genre = try container.decode(String.self, forKey: .genre)
        self.director = try container.decode(String.self, forKey: .director)
        self.writer = try container.decode(String.self, forKey: .writer)
        self.actors = try container.decode(String.self, forKey: .actors)
        self.plot = try container.decode(String.self, forKey: .plot)
        self.language = try container.decode(String.self, forKey: .language)
        self.country = try container.decode(String.self, forKey: .country)
        self.awards = try container.decode(String.self, forKey: .awards)
        self.poster = try container.decode(String.self, forKey: .poster)
        self.ratings = try container.decode([MovieRatingsDataModel].self, forKey: .ratings)
        self.metascore = try container.decode(String.self, forKey: .metascore)
        self.imdbRating = try container.decode(String.self, forKey: .imdbRating)
        self.imdbVotes = try container.decode(String.self, forKey: .imdbVotes)
        self.imdbID = try container.decode(String.self, forKey: .imdbID)
        self.type = try container.decode(String.self, forKey: .type)
//        self.dvd = try container.decode(String?.self, forKey: .dvd)
//        self.boxOffice = try container.decode(String?.self, forKey: .boxOffice)
//        self.production = try container.decode(String.self, forKey: .production)
//        self.website = try container.decode(String.self, forKey: .website)
        self.response = try container.decode(String.self, forKey: .response)
    }
    
    func getMovieDomainModel() -> MoviesInfoDomainModel {
        return MoviesInfoDomainModel(
            title: self.title,
            year: self.year,
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
            imdbID: self.imdbID //,
//            production: self.production
        )
    }
}

class MovieRatingsDataModel: Codable {
    var source: String? // "Metacritic",
    var value: String? // "73/100"
    
    enum CodingKeys: String, CodingKey {
        case source = "Source" //****************************
        case value = "Value" //****************************
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(String.self, forKey: .source)
        self.value = try container.decode(String.self, forKey: .value)
    }
    
    func getMovieRatingsDomainModel() -> MovieRatingsDomainModel {
        return MovieRatingsDomainModel(source: self.source, value: self.value)
    }
}
