//
//  MovieListCellView.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import SwiftUI

struct MovieListView: View {
    var movies: [MoviesInfoDomainModel] = []
    weak var delegate: AllMovieCellDelegate?
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(movies, id: \.self) { movie in
                    AllMoviesInnerCellView(movieData: movie, delegate: delegate)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.size.width-40)
    }
}

#Preview {
    MovieListView()
}
