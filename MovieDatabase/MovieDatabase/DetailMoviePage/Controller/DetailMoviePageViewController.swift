//
//  DetailMoviePageViewController.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import UIKit
import SwiftUI

class DetailMoviePageViewController: UIViewController {

    var movie: MoviesInfoDomainModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
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
