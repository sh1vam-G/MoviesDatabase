//
//  ViewController.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 05/08/24.
//

import UIKit
import SwiftUI

class SearchPageViewController: BaseViewController {

    var viewModel: SearchPageViewModel = SearchPageViewModel()
    
    func setUpSearchView() {
        let searchPageView = SearchPageView(moviesInfo: viewModel.moviesInfo, otherCellDelegate: self , allMovieCellDelegate: self)
        let hostingController = UIHostingController(rootView: searchPageView)
        let view = hostingController.view ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            view.topAnchor.constraint(equalTo: self.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchMoviesInfo()
        setUpSearchView()
    }
}

extension SearchPageViewController: OtherInnerCellDelegate, AllMovieCellDelegate {
    func cellTapped(genre: String, type: SearchPageOptions) {
        let movies = viewModel.getMoviesListOnTapped(value: genre, type: type)
        self.navigationController?.pushViewController(MovieListViewController(movies: movies), animated: true)
    }
    
    func cellTapped(movie: MoviesInfoDomainModel) {
        self.navigationController?.pushViewController(DetailMoviePageViewController(movie: movie), animated: true)
    }
    
}

