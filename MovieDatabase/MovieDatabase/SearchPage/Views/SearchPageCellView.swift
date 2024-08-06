//
//  SearchPageCellView.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import SwiftUI

struct SearchPageCellView: View {
    var typeOfCell: SearchPageOptions
    @ObservedObject var moviesInfo: MoviesInfo
    @State private var buttonTapped: Bool = false
    weak var otherCellDelegate: OtherInnerCellDelegate?
    weak var allMovieCellDelegate: AllMovieCellDelegate?
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("\(typeOfCell.rawValue)")
                    .padding(20)
                    .padding(.bottom, 10)
                    .overlay {
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.2))
                            .offset(CGSize(width: 160.0, height: 25.0))
                            .frame(width: UIScreen.main.bounds.size.width-40, height: 1)
                    }
                Spacer()
                Image(systemName: buttonTapped ? "chevron.down" : "chevron.forward")
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            buttonTapped.toggle()
                        }
                    }
                Spacer()
                    .frame(width: 40)
            }
            if buttonTapped {
                switch typeOfCell {
                case .year:
                    ForEach(moviesInfo.years ?? [], id: \.self) { year in
                        OtherTypesInnerCellView(
                            delegate: otherCellDelegate,
                            genreValue: year,
                            cellType: .year
                        )
                    }
                case .genre:
                    ForEach(moviesInfo.genres ?? [], id: \.self) { genre in
                        OtherTypesInnerCellView(
                            delegate: otherCellDelegate,
                            genreValue: genre,
                            cellType: .genre
                        )
                    }
                case .directors:
                    ForEach(moviesInfo.directors ?? [], id: \.self) { director in
                        OtherTypesInnerCellView(
                            delegate: otherCellDelegate,
                            genreValue: director,
                            cellType: .directors
                        )
                    }
                case .actors:
                    ForEach(moviesInfo.actors ?? [], id: \.self) { actor in
                        OtherTypesInnerCellView(
                            delegate: otherCellDelegate,
                            genreValue: actor,
                            cellType: .actors
                        )
                    }
                case .allMovies:
                    ForEach(moviesInfo.moviesDomainModel ?? [], id: \.self) { movie in
                        if movie.title != nil {
                            AllMoviesInnerCellView(
                                movieData: movie,
                                delegate: allMovieCellDelegate
                            )
                        }
                    }
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width-40, height: 1)
                    .offset(CGSize(width: 15.0, height: 0))
                    .foregroundColor(Color(hex: "#eeeeee"))
            }
        }
    }
}
#Preview {
    SearchPageCellView(typeOfCell: .actors, moviesInfo: MoviesInfo(moviesDomainModel: []))
}
