//
//  BioViewController.swift
//  URLSessionTest
//
//  Created by Vladislav Suslov on 13.11.22.
//

import UIKit

class BioViewController: UIViewController {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var filmsLabel: UILabel!
    @IBOutlet var shortFilmsLabel: UILabel!
    @IBOutlet var tvShowsLabel: UILabel!
    @IBOutlet var videoGamesLabel: UILabel!
    
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        setupLabels()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        characterImage.layer.borderColor = UIColor.black.cgColor
        characterImage.layer.borderWidth = 1
        characterImage.layer.cornerRadius = characterImage.bounds.height / 2
    }
    
    private func setupLabels() {
        nameLabel.text = character.name
        filmsLabel.text = character.films.isEmpty ? "None" : character.films.joined()
        shortFilmsLabel.text = character.shortFilms.isEmpty ? "None" : character.shortFilms.joined()
        tvShowsLabel.text = character.tvShows.isEmpty ? "None" : character.tvShows.joined()
        videoGamesLabel.text = character.videoGames.isEmpty ? "None" : character.videoGames.joined()
    }
    
    
    private func setImage() {
        NetworkManager.shared.fetchData(from: character.imageURL) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.activityIndicator.stopAnimating()
                self?.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                self?.characterImage.image = UIImage(systemName: "person") ?? UIImage()
                print(error)
            }
        }
    }

}
