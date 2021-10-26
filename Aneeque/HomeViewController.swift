//
//  ViewController.swift
//  Aneeque
//
//  Created by  Decagon on 24/10/2021.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let cards: [Card] = {
        let firstCard = Card(title: "Irun Chair", time: "By Seto", imageName: "another1", message: "Ergonmical for humans \n body curve.", price: "$120.00")
        let secondCard = Card(title: "Malik Chair", time: "By Karjo", imageName: "another2", message: "Extra comfy chair with a \n palm rest", price: "$221.00")
        let thirdCard = Card(title: "Seto Chair", time: "By Waris", imageName: "another3", message: "Ergonmical for humans \n body curve.", price: "$221.00")
      return [firstCard, secondCard, thirdCard]
    }()
    
    lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      layout.minimumLineSpacing = 45
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collectionView.dataSource = self
      collectionView.delegate = self
        collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
      collectionView.showsVerticalScrollIndicator = false
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      return collectionView
    }()
    let contentView: UIView = {
    let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
      return content
    }()
    let scrollView: UIScrollView = {
    let scroll = UIScrollView()
      scroll.showsHorizontalScrollIndicator = false
      scroll.translatesAutoresizingMaskIntoConstraints = false
      return scroll
    }()
    private var messageLabel: UILabel = {
      let label = UILabel()
      label.text = "Perfect Choice!"
        label.textColor = UIColor(red: 0.0078, green: 0, blue: 0.1373, alpha: 1.0)
      label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
      label.numberOfLines = 1
      return label
    }()
    private var titleLabel: UILabel = {
      let label = UILabel()
      label.text = "Best Furniture"
        label.textColor = UIColor(red: 0.2588, green: 0.2667, blue: 0.3098, alpha: 1.0)
      label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28)
      label.numberOfLines = 1
      return label
    }()

    private let signButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(systemName: "list.bullet.rectangle"), for: .normal)
        button.layer.cornerRadius = 16
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let allButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.2588, green: 0.2667, blue: 0.3098, alpha: 1.0)
        button.setTitle("All", for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let chairButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.2588, green: 0.2667, blue: 0.3098, alpha: 1.0), for: .normal)
        button.setTitle("Chair", for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let tableButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.2588, green: 0.2667, blue: 0.3098, alpha: 1.0), for: .normal)
        button.setTitle("Table", for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let lampButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.2588, green: 0.2667, blue: 0.3098, alpha: 1.0), for: .normal)
        button.setTitle("Lamp", for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let floorButton: UIButton = {
        let button = UIButton()
        button.tintColor = .red
        button.setTitleColor(UIColor(red: 0.2588, green: 0.2667, blue: 0.3098, alpha: 1.0), for: .normal)
        button.isEnabled = false
        button.setTitle("Floor", for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var searchTextField: LeftPaddedTextField = {
        let textfield = LeftPaddedTextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        let centeredParagraphStyle = NSMutableParagraphStyle()
//        centeredParagraphStyle.alignment = .left
            let attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
            textfield.attributedPlaceholder = attributedPlaceholder
        textfield.leftViewMode = UITextField.ViewMode.always
        textfield.leftPadding = 10
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        textfield.leftView = imageView
        textfield.layer.borderColor = UIColor.white.cgColor
        textfield.backgroundColor = UIColor(red: 0.7647, green: 0.7686, blue: 0.7882, alpha: 1.0)
        textfield.layer.cornerRadius = 15
        textfield.layer.borderWidth = 1
        return textfield
    }()
    var color = UIColor(red: 0.2588, green: 0.2667, blue: 0.3098, alpha: 1.0)
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        view.backgroundColor = .white
        setUpConstraint()
        collectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }

    func setUpView() {
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        view.addSubview(searchTextField)
        view.addSubview(signButton)
        view.addSubview(allButton)
        view.addSubview(chairButton)
        view.addSubview(tableButton)
        view.addSubview(lampButton)
        view.addSubview(floorButton)
        view.addSubview(collectionView)

    }
    
    func setUpConstraint() {
        setUpView()
        collectionView.anchorWithConstantsToTop(top: allButton.topAnchor,
                                                left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, topConstant: 70, leftConstant: 0, bottomConstant: 70, rightConstant: 0)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            searchTextField.heightAnchor.constraint(equalToConstant: 52),
            signButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            signButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 20),
            signButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signButton.heightAnchor.constraint(equalToConstant: 52),
            allButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            allButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            allButton.widthAnchor.constraint(equalToConstant: 50),
            allButton.heightAnchor.constraint(equalToConstant: 32),
            chairButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            chairButton.leadingAnchor.constraint(equalTo: allButton.trailingAnchor, constant: 30),
            chairButton.widthAnchor.constraint(equalToConstant: 50),
            chairButton.heightAnchor.constraint(equalToConstant: 32),
            tableButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            tableButton.leadingAnchor.constraint(equalTo: chairButton.trailingAnchor, constant: 30),
            tableButton.widthAnchor.constraint(equalToConstant: 50),
            tableButton.heightAnchor.constraint(equalToConstant: 32),

            lampButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            lampButton.leadingAnchor.constraint(equalTo: tableButton.trailingAnchor, constant: 30),
            lampButton.widthAnchor.constraint(equalToConstant: 50),
            lampButton.heightAnchor.constraint(equalToConstant: 32),

            floorButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            floorButton.leadingAnchor.constraint(equalTo: lampButton.trailingAnchor, constant: 30),
            floorButton.widthAnchor.constraint(equalToConstant: 50),
            floorButton.heightAnchor.constraint(equalToConstant: 32),
          
            
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ExploreCollectionViewCell else { return UICollectionViewCell() }
        cell.layer.cornerRadius = 60
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
//        cell.backgroundColor = .red
        let page = cards[indexPath.row]
        cell.card = page
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: view.frame.width, height: 250)
    }
    
}

extension UIView {
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                                  bottom: NSLayoutYAxisAnchor? = nil,
                                  right: NSLayoutXAxisAnchor? = nil,
                                  topConstant: CGFloat = 0,
                                  leftConstant: CGFloat = 0,
                                  bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
}

class LeftPaddedTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 5)
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    @IBInspectable var leftPadding: CGFloat = 0
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
}
