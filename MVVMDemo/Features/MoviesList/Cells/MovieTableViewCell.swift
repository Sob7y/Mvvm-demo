//
//  MovieTableViewCell.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieNamelabel: UILabel!
    
    var movieModel: MoviesModel? {
        didSet {
            bind()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func bind() {
        if let movieUrl = URL(string: Constant.imageBaseUrl + (movieModel?.posterPath ?? "")) {
            movieImage.sd_setImage(with: movieUrl)
        }
        
        movieNamelabel.text = movieModel?.title ?? ""
    }
}
