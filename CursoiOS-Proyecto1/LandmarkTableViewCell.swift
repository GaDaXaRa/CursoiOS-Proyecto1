//
//  LandmarkTableViewCell.swift
//  CursoiOS-Proyecto1
//
//  Created by Miguel Santiago on 17/1/22.
//

import UIKit

struct LandmarkTableViewCellViewModel {
    let title: String
    let description: String?
    let image: UIImage?
}

class LandmarkTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    func configure(with viewModel: LandmarkTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        cellImage.image = viewModel.image
    }
}
