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
    @State private var searchingText: String = ""
    var body: some View {
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
                            SearchPageCellView(typeOfCell: val)
                        }
                    }
                    .padding(.leading, 10)
                } else {
                    
                }
            }
        }
    }
}

struct SearchPageCellView: View {
    var typeOfCell: SearchPageOptions
    @State private var buttonTapped: Bool = true
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("\(typeOfCell.rawValue)")
                    .padding(20)
                    .padding(.bottom, 10)
                    .overlay {
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.2))
                            .offset(CGSize(width: 120.0, height: 25.0))
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
                ForEach ( 0...0, id: \.self) { _ in
                    switch typeOfCell {
                    case .allMovies:
                        AllMoviesInnerCellView()
                    default:
                        OtherTypesInnerCellView()
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

struct OtherTypesInnerCellView: View {
    var body: some View {
        HStack(alignment: .center) {
//            Text("some value)")
//                .padding(20)
//                .padding(.bottom, 10)
//                .padding(.leading, 40)
        }
    }
}

struct AllMoviesInnerCellView: View {
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "house")
                .resizable()
                .frame(width: 70, height: 100)
                .padding()
            VStack(alignment: .leading) {
                Text("movie name")
                Text("Language: ")
                Text("Year: ")
            }
            .padding(20)
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    SearchPageView()
}
