//
//  HomeCollectionViewCell.swift
//  Aneeque
//
//  Created by  Decagon on 25/10/2021.
//

import UIKit
class ExploreCollectionViewCell: UICollectionViewCell {
  // MARK: - VARIABLE
  var card: Card? {
    didSet {
      guard let card = card else {
        return
      }
      let imageName = card.imageName
      imageView.image = UIImage(named: imageName)
      let title = card.title
      nameLabel.text = title
      let time = card.time
      timeLabel.text = time
        let message = card.message
        messageLabel.text = message
        let price = card.price
        priceLabel.text = price
        let color = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
        let attributedText = NSMutableAttributedString(string: card.title,
                                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium), NSAttributedString.Key.foregroundColor: color])
        let attributedText2 = NSMutableAttributedString(string: card.time,
                                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 9, weight: .medium), NSAttributedString.Key.foregroundColor: color])
        let attributedText3 = NSMutableAttributedString(string: card.message,
                                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium), NSAttributedString.Key.foregroundColor: color])
        nameLabel.attributedText = attributedText
        timeLabel.attributedText = attributedText2
        messageLabel.attributedText = attributedText3
    }
  }
  // MARK: - NAME LABEL TO DISPLAY THE NAME
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 1
    return label
  }()
    lazy var messageLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 2
      return label
    }()
  // MARK: - TIME LABEL TO DISPLAY THE TIME
  lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 1
    return label
  }()
    lazy var priceLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 1
      return label
    }()
  // MARK: - IMAGE LABEL
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 40
//    imageView.backgroundColor = .red
    imageView.layer.masksToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - NEXT BUTTON LABEL
  lazy var nextButtonIcon: UIButton = {
    let button = UIButton()
    button.setTitle("Buy", for: .normal)
    button.backgroundColor = .black
    button.layer.cornerRadius = 15
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpView()
  }
  // MARK: - FUNCTION TO SET UP VIEWS
  func setUpView() {
    backgroundColor = .white
    addSubview(nameLabel)
    addSubview(timeLabel)
    addSubview(imageView)
    addSubview(nextButtonIcon)
    addSubview(priceLabel)
    addSubview(messageLabel)
    NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        imageView.heightAnchor.constraint(equalToConstant: 190),
        imageView.widthAnchor.constraint(equalToConstant: 190),
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
        nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
        timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
        timeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
        timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
        messageLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 30),
        messageLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
        priceLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 60),
        priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
        nextButtonIcon.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 20),
        nextButtonIcon.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 50),
        nextButtonIcon.heightAnchor.constraint(equalToConstant: 40),
        nextButtonIcon.widthAnchor.constraint(equalToConstant: 70),
        
    ])
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
