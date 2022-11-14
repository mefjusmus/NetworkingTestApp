//
//  CharactersListViewController.swift
//  URLSessionTest
//
//  Created by Vladislav Suslov on 13.11.22.
//

import UIKit

class CharactersViewController: UITableViewController {
    
    private var characters: [Character] = [] {
        didSet {
            print(characters)
        }
    }
    private var activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        fetchCharacters()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bioViewController = segue.destination as? BioViewController
        bioViewController?.character = characters[tableView.indexPathForSelectedRow?.row ?? 0]
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        guard let characterCell = cell as? CharacterCell else { return cell }
        characterCell.configure(with: characters[indexPath.row])
        return cell
    }
    
    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: view.center.x, y: view.center.y, width: 5, height: 5))
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    private func fetchCharacters() {
        NetworkManager.shared.fetchCharacters(from: Link.disneyCharactersURL.rawValue) { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters = characters
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}
