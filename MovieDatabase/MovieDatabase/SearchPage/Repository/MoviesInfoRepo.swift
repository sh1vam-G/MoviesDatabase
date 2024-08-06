//
//  MoviesInfoRepo.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import Foundation

class MoviesInfoRepo {
    var service = MovieInfoFetchingService()
    func fetchMoviesInfo() -> [MoviesInfoDomainModel]? {
        return service.fetchMoviesInfo()
    }
}
