import UIKit

class CharacterDetailViewController: UIViewController {
    
    var character: MovieCharacter?
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = character?.name
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
//        presenter?.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(label)
        view.backgroundColor = .white
        setupConstraints()
    }
    

    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

}
