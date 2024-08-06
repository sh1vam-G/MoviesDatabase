//
//  MovieInfoFetchingService.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import Foundation

class MovieInfoFetchingService: BaseService {
    func fetchMoviesInfo() -> [MoviesInfoDomainModel]? {
        let data = getData(bundleLocation: Self.self, type: [MoviesInfoDataModel].self, fileName: "MoviesInfo")
        return data?.map{ $0.getMovieDomainModel() }
    }
}
