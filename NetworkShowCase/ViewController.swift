import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let netWorkManager = NetworkManager.shared
    
    lazy var button: UIButton = {
       let button = UIButton()
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var jokeLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(jokeLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        jokeLabel.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(4)
//            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }
    
    @objc 
    func buttonTapped() {
        print("Button was tapped")
        netWorkManager.getJoke { joke in
//            print(joke)
            DispatchQueue.main.async {
                if let joke = joke {
                    self.jokeLabel.text = "\(joke.setup)\n\(joke.punchline)"
                }
            }
        }
    }
        
}

