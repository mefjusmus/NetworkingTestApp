//
//  BioViewController.swift
//  URLSessionTest
//
//  Created by Vladislav Suslov on 13.11.22.
//

import UIKit

class BioViewController: UIViewController {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setImage()
        nameLabel.text = character.name
        descriptionLabel.text = character.description
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        characterImage.layer.borderColor = UIColor.black.cgColor
        characterImage.layer.borderWidth = 1
        characterImage.layer.cornerRadius = characterImage.bounds.height / 2
    }
    
    
    
    
//    private func setImage() {
//        NetworkManager.shared.fetchImage(from: character.imageURL) { [weak self] result in
//            switch result {
//            case .success(let imageData):
//                self?.characterImage.image = UIImage(data: imageData)
//                self?.activityIndicator.stopAnimating()
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }

}
