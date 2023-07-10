//
//  MainMovieTableViewCell.swift
//  MovieAppSonHal
//
//  Created by Umut Şenol on 7.07.2023.
//

import UIKit
import SDWebImage

class MainMovieTableViewCell: UITableViewCell {
    
    public static var identifier: String {
            get {
                return "MovieTableViewCell"
            }
        }

       public static func register() -> UINib {
             UINib(nibName: "MainMovieTableViewCell", bundle: nil)
        }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ımdbLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setupCell(viewModel: MovieTableCellViewModel){
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.ımdbLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
}
