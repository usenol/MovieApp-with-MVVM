//
//  MovieTableCellViewModel.swift
//  MovieAppSonHal
//
//  Created by Umut Şenol on 7.07.2023.
//

import Foundation

class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.rating = "Imdb : \(movie.voteAverage)/10"
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.imageUrl = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(APIConstants.shared.imageServerAddress)\(imageCode)")
    }
}
