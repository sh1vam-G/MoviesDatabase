//
//  MovieListViewController.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import UIKit
import SwiftUI

class MovieListViewController: UIViewController, AllMovieCellDelegate {
    func cellTapped(movie: MoviesInfoDomainModel) {
        self.navigationController?.pushViewController(DetailMoviePageViewController(movie: movie), animated: true)
    }
    var movies: [MoviesInfoDomainModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listView = MovieListView(movies: movies, delegate: self)
        let hostingController = UIHostingController(rootView: listView)
        let subView = hostingController.view ?? UIView()
        subView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(subView)
        
        NSLayoutConstraint.activate([
            self.view.leadingAnchor.constraint(equalTo: subView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: subView.trailingAnchor),
            self.view.topAnchor.constraint(equalTo: subView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: subView.bottomAnchor),
        ])
        self.title = "Movies List"
    }
    convenience init(movies: [MoviesInfoDomainModel]) {
        self.init()
        self.movies = movies
    }
    
}
