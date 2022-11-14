//
//  PersonCell.swift
//  URLSessionTest
//
//  Created by Vladislav Suslov on 13.11.22.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        characterImage.layer.cornerRadius = characterImage.bounds.height / 2
    }
    
    
    func configure(with character: Character) {
        characterName.text = character.name
        
//        NetworkManager.shared.fetchImage(from: character.imageURL) { [weak self] result in
//            switch result {
//            case .success(let imageData):
//                self?.characterImage.image = UIImage(data: imageData)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
}
