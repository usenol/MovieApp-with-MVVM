//
//  DetailsViewController.swift
//  MovieAppSonHal
//
//  Created by StajyerU on 7.07.2023.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textViewDesc: UITextView!
    
    //ViewModel
    var viewModel: DetailsMovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
    
    func configView() {
        titleLabel.text = viewModel?.movieTitle
        imageView.sd_setImage(with: viewModel?.movieImage)
        textViewDesc.text = viewModel?.movieDescription
    }
    
}
