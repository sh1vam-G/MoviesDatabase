//
//  DetailedMoviePageView.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import SwiftUI

struct DetailedMoviePageCellView: View {
    var movieInfo: MoviesInfoDomainModel
    @State private var picker: [MovieRatingsDomainModel] = []
    @State private var selectedPicker: MovieRatingsDomainModel
    private var castCrew = ""
    private var release = ""
    private var genre = ""
    init(movieInfo: MoviesInfoDomainModel) {
        self.movieInfo = movieInfo
        self.picker = movieInfo.ratings ?? []
        self.castCrew = "Cast & Crew: "
                         + (movieInfo.actors ?? String())
                         + ", " + (movieInfo.director ?? String())
                         + ", " + (movieInfo.writer ?? String())
        self.release = "Released: " + (movieInfo.released ?? String())
        self.genre = "Genre: " + (movieInfo.genre ?? String())
        self.selectedPicker = movieInfo.ratings?.first ?? MovieRatingsDomainModel(source: "", value: "")
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: (movieInfo.poster ?? String())), content: {
                    image in
                    image
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width-40, height: 400)
                        .padding()
                }, placeholder: {
                    Image(systemName: "exclamationmark.icloud.fill")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width-40, height: 400)
                        .foregroundColor(Color(hex: "#cccccc"))
                        .padding()
                })
                Text(movieInfo.title ?? String())
                    .font(.title)
                    .padding(.horizontal, 20)
                Text(movieInfo.plot ?? String())
                    .font(.headline)
                    .padding(.horizontal, 10)
                    .padding(10)
                    .lineLimit(4)
                Text(castCrew
                )
                .font(.body)
                .padding(.horizontal, 15)
                .padding(5)
                Text(release)
                    .font(.body)
                    .padding(.horizontal, 15)
                    .padding(5)
                Text(genre)
                    .font(.body)
                    .padding(.horizontal, 15)
                    .padding(5)
                if selectedPicker.source != "" {
                    Text("Ratings: ")
                        .font(.body)
                        .padding(.horizontal, 15)
                        .padding(5)
                    HStack {
                        Picker("Ratings", selection: $selectedPicker) {
                            ForEach(picker, id: \.self) {
                                pick in
                                Text(pick.source ?? String())
                            }
                        }
                        Text(selectedPicker.value ?? String())
                    }
                    .padding(20)
                }
            }
        }
    }
}

#Preview {
    DetailedMoviePageCellView(
        movieInfo: MoviesInfoDomainModel(
            title: "title",
            year: "year",
            released: "released",
            genre: "genre",
            director: "director",
            writer: "writer",
            actors: "actors",
            plot: "plot",
            language: "language",
            poster: "poster",
            ratings: [],
            imdbRating: "ratings",
            imdbVotes: "votes",
            imdbID: "id",
            type: "type",
            production: "production"
        )
    )
}
