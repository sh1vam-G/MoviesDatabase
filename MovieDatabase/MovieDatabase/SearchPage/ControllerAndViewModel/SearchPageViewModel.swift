//
//  SearchPageViewModel.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 05/08/24.
//

import Foundation

class SearchPageViewModel {
    private var repo = MoviesInfoRepo()
    private var moviesInfo: [MoviesInfoDomainModel?]?
    func fetchMoviesInfo() {
        moviesInfo = repo.fetchMoviesInfo()
        print(moviesInfo)
//        print(moviesInfo?.first?.genre)
    }
}
