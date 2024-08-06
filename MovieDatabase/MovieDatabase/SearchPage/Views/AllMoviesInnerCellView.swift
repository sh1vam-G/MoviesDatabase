//
//  AllMoviesInnerCellView.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import SwiftUI

protocol AllMovieCellDelegate: AnyObject {
    func cellTapped(movie: MoviesInfoDomainModel)
}

struct AllMoviesInnerCellView: View {
    @ObservedObject var movieData: MoviesInfoDomainModel
    weak var delegate: AllMovieCellDelegate?
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: movieData.poster ?? String()), content: {
                image in
                image
                    .resizable()
                    .frame(width: 80, height: 100)
                    .padding()
            }, placeholder: {
                Image(systemName: "exclamationmark.icloud.fill")
                    .resizable()
                    .frame(width: 80, height: 100)
                    .foregroundColor(Color(hex: "#cccccc"))
                    .padding()
            })
            VStack(alignment: .leading) {
                Text(movieData.title ?? String())
                    .font(.headline)
                    .lineLimit(2)
                if let language = movieData.language {
                    Text("Language: " + language)
                        .font(.body)
                }
                if let year = movieData.year {
                    Text("Year: " + year)
                        .font(.body)
                }
            }
            .padding(20)
            .padding(.bottom, 10)
            Spacer()
        }
        .onTapGesture {
            delegate?.cellTapped(movie: movieData)
        }
    }
}

#Preview {
    Text("")
//    AllMoviesInnerCellView()
}
