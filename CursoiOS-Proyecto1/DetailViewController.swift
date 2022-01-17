//
//  DetailViewController.swift
//  CursoiOS-Proyecto1
//
//  Created by Miguel Santiago on 17/1/22.
//

import UIKit

struct DetailViewModel {
    let name: String
    let description: String?
    let image: UIImage?
}

class DetailViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(with: viewModel)
    }
    
    func configure(with viewModel: DetailViewModel?) {
        descriptionLabel.text = viewModel?.description
        titleLabel.text = viewModel?.name
        detailImageView.image = viewModel?.image
    }
}
