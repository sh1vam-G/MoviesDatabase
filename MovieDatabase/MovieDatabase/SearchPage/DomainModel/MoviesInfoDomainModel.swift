//
//  MoviesInfoDomainModel.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 05/08/24.
//

import Foundation
import Combine

class MoviesInfo: ObservableObject {
    @Published var moviesDomainModel: [MoviesInfoDomainModel]?
    @Published var genres: [String]?
    @Published var years: [String]?
    @Published var directors: [String]?
    @Published var actors: [String]?
    
    init(moviesDomainModel: [MoviesInfoDomainModel]?) {
        self.moviesDomainModel = moviesDomainModel
    }
    
    func filterMoviesUsing(text: String) -> [MoviesInfoDomainModel] {
        var movies: [MoviesInfoDomainModel] = []
        movies.append(contentsOf: moviesDomainModel?.filter{ $0.title?.contains(text) ?? false} ?? [])
        movies.append(contentsOf: moviesDomainModel?.filter{ $0.genre?.contains(text) ?? false} ?? [])
        movies.append(contentsOf: moviesDomainModel?.filter{ $0.actors?.contains(text) ?? false} ?? [])
        movies.append(contentsOf: moviesDomainModel?.filter{ $0.director?.contains(text) ?? false} ?? [])
        movies = Array(Set(movies)).sorted(by: { $0.title != $1.title })
        return movies
    }
}

class MoviesInfoDomainModel: ObservableObject, Hashable {
    var id: UUID = UUID()
    @Published var title: String?
    @Published var year: String?
    @Published var released: String?
    @Published var genre: String?
    @Published var director: String?
    @Published var writer: String?
    @Published var actors: String?
    @Published var plot: String?
    @Published var language: String?
    @Published var poster: String?
    @Published var ratings: [MovieRatingsDomainModel]?
    @Published var imdbRating: String?
    @Published var imdbVotes: String?
    @Published var imdbID: String?
    @Published var production: String?
    @Published var type: String?
    
    init(
        title: String?,
        year: String?,
        released: String?,
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
        imdbID: String?,
        type: String?,
        production: String?
    ) {
        self.title = title
        self.year = year
        self.released = released
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
        self.type = type
        self.production = production
    }
    
    static func == (lhs: MoviesInfoDomainModel, rhs: MoviesInfoDomainModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class MovieRatingsDomainModel: ObservableObject, Hashable {
    
    @Published var source: String?
    @Published var value: String?
    
    init(
        source: String?,
        value: String?
    ) {
        self.source = source
        self.value = value
    }
    
    static func == (lhs: MovieRatingsDomainModel, rhs: MovieRatingsDomainModel) -> Bool {
        return lhs.source == rhs.source && lhs.value == rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(source)
    }
}
