import UIKit
import SnapKit

protocol CharactersView {
    func displayCharacters(_ characters: [MovieCharacter])
    func showError(_ error: String)
}

class CharactersViewController: UIViewController {
    
    var presenter: CharactersPresentationLogic?
    
    var characters = [MovieCharacter]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        setupConstraints()
    }
    

    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()

        content.text = characters[indexPath.row].name
        content.secondaryText = characters[indexPath.row].birth_year

        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVc = CharacterDetailViewController()
        nextVc.character = characters[indexPath.row]
        navigationController?.pushViewController(nextVc, animated: true)
    }
    
}


extension CharactersViewController: CharactersView {
    func showError(_ error: String) {
        self.showTopToast(message: error, font: .systemFont(ofSize: 18))
    }
    
    func displayCharacters(_ characters: [MovieCharacter]) {
        self.characters = characters
    }
    
    
}
