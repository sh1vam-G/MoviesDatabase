//
//  SearchPageViewModel.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 05/08/24.
//

import Foundation
import SwiftUI

class SearchPageViewModel {
    private var repo = MoviesInfoRepo()
    @ObservedObject var moviesInfo: MoviesInfo = MoviesInfo(moviesDomainModel: [])
    
    func fetchMoviesInfo() {
        moviesInfo = MoviesInfo(moviesDomainModel: repo.fetchMoviesInfo())
        takeOutMovies()
        setGenres()
        setYears()
        setActors()
        setDirectors()
        print(moviesInfo)
    }
    
    func takeOutMovies() {
        moviesInfo.moviesDomainModel = moviesInfo.moviesDomainModel?.filter{ $0.type?.lowercased() == "movie"}
    }
    
    func setGenres() {
        var genres: [String] = []
        moviesInfo.moviesDomainModel?.forEach { value in
            if let genre = value.genre?.components(separatedBy: ",") {
                genres.append(contentsOf: genre.map{ $0.trimmingCharacters(in: .whitespaces)}.filter{ $0 != "N/A"})
            }
        }
        moviesInfo.genres = Array(Set(genres)).sorted()
    }
    
    func setYears() {
        var years: [String] = []
        moviesInfo.moviesDomainModel?.forEach { value in
            if let year = value.year {
                years.append(year)
            }
        }
        moviesInfo.years = Array(Set(years)).sorted()
    }
    
    func setDirectors() {
        var directors: [String] = []
        moviesInfo.moviesDomainModel?.forEach { value in
            if let director = value.director, director != "N/A" {
                directors.append(director)
            }
        }
        moviesInfo.directors = Array(Set(directors))
    }
    
    func setActors() {
        var actors: [String] = []
        moviesInfo.moviesDomainModel?.forEach { value in
            if let actor = value.actors?.components(separatedBy: ",") {
                actors.append(contentsOf: actor.map{ $0.trimmingCharacters(in: .whitespaces)}.filter{ $0 != "N/A"})
            }
        }
        moviesInfo.actors = Array(Set(actors))
    }
    
    func getGenreMovies(having genre: String) -> [MoviesInfoDomainModel]? {
        return moviesInfo.moviesDomainModel?.filter { $0.genre?.contains(genre) ?? false } ?? []
    }
    func getYearMovies(having year: String) -> [MoviesInfoDomainModel]? {
        return moviesInfo.moviesDomainModel?.filter { $0.year == year } ?? []
    }
    func getActorMovies(having actor: String) -> [MoviesInfoDomainModel]? {
        return moviesInfo.moviesDomainModel?.filter { $0.actors?.contains(actor) ?? false } ?? []
    }
    func getDirectorMovies(having director: String) -> [MoviesInfoDomainModel]? {
        return moviesInfo.moviesDomainModel?.filter { $0.director == director } ?? []
    }
    
    func getMoviesListOnTapped(value: String, type: SearchPageOptions) -> [MoviesInfoDomainModel] {
        var movies: [MoviesInfoDomainModel] = []
        switch type {
        case .year:
            movies.append(contentsOf: self.getYearMovies(having: value) ?? [])
        case .genre:
            movies.append(contentsOf: self.getGenreMovies(having: value) ?? [])
        case .directors:
            movies.append(contentsOf: self.getDirectorMovies(having: value) ?? [])
        case .actors:
            movies.append(contentsOf: self.getActorMovies(having: value) ?? [])
        default:
            movies.append(contentsOf: self.getYearMovies(having: value) ?? [])
        }
        movies = Array(Set(movies))
        return movies
    }
}
