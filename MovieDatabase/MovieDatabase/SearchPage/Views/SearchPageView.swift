//
//  SearchPageView.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 05/08/24.
//

import SwiftUI

enum SearchPageOptions: String, CaseIterable {
    case year = "Year"
    case genre = "Genre"
    case directors = "Directors"
    case actors = "Actors"
    case allMovies = "All Movies"
}
struct SearchPageView: View {
    @ObservedObject var moviesInfo: MoviesInfo
    @State private var searchingText: String = ""
    @State private var localId: UUID = UUID()
    
    weak var otherCellDelegate: OtherInnerCellDelegate?
    weak var allMovieCellDelegate: AllMovieCellDelegate?
    
    var body: some View {
        VStack {
            Text("Movie Database")
                .font(.title)
            ScrollViewReader { scrollProxy in
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search movies by title/actor/genre/directors", text: $searchingText)
                        }
                        .padding(10)
                        .background(Color(hex: "#eeeeee"))
                        .cornerRadius(10)
                        .padding(20)
                        if searchingText == "" {
                            ForEach(SearchPageOptions.allCases, id: \.self) { val in
                                HStack(alignment: .center) {
                                    SearchPageCellView(
                                        typeOfCell: val,
                                        moviesInfo: moviesInfo,
                                        otherCellDelegate: otherCellDelegate,
                                        allMovieCellDelegate: allMovieCellDelegate
                                    )
                                }
                            }
                            .padding(.leading, 10)
                        } else if moviesInfo.filterMoviesUsing(text: searchingText).count > 0 {
                            ForEach(moviesInfo.filterMoviesUsing(text: searchingText), id: \.self) { value in
                                AllMoviesInnerCellView(
                                    movieData: value,
                                    delegate: allMovieCellDelegate
                                )
//                                .scrollPosition(id: value.id)
                            }
                        } else {
                            Text("No Results")
                                .font(.headline)
                                .padding()
                                .foregroundColor(Color(hex: "#bbbbbb"))
                        }
                    }
                }
                .onAppear {
//                    if savedId != nil {
//                        
//                    }
                }
            }
        }
    }
}

#Preview {
    SearchPageView(moviesInfo: MoviesInfo(moviesDomainModel: []))
}
