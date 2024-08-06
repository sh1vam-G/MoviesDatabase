//
//  DetailMoviePageViewController.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import UIKit
import SwiftUI

//MARK: view model for this controller has not been created separately because reponsibilities are less over the controller in present scenario. If scope increases then ViewModel can be added easily
class DetailMoviePageViewController: UIViewController {

    var movie: MoviesInfoDomainModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        self.title = movie?.title ?? String()
    }
    
    convenience init(movie: MoviesInfoDomainModel?) {
        self.init()
        self.movie = movie
    }
    
    func setUpView() {
        if let movie = movie {
            let detailView = DetailedMoviePageCellView(movieInfo: movie)
            let hostingController = UIHostingController(rootView: detailView)
            let subView = hostingController.view ?? UIView()
            subView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(subView)
            
            NSLayoutConstraint.activate([
                self.view.leadingAnchor.constraint(equalTo: subView.leadingAnchor),
                self.view.trailingAnchor.constraint(equalTo: subView.trailingAnchor),
                self.view.topAnchor.constraint(equalTo: subView.topAnchor),
                self.view.bottomAnchor.constraint(equalTo: subView.bottomAnchor),
            ])
        }
    }
}
