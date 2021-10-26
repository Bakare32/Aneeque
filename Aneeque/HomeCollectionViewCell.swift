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
    }
  }
  // MARK: - NAME LABEL TO DISPLAY THE NAME
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
//    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 25)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - TIME LABEL TO DISPLAY THE TIME
  lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    // label.text = "20 mins"
//    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 13)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - IMAGE LABEL
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - NEXT BUTTON LABEL
  lazy var nextButtonIcon: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Button"), for: .normal)
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
    nameLabel.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 37, leftConstant: 45, bottomConstant: 106, rightConstant: -147)
    timeLabel.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 90, leftConstant: 45, bottomConstant: 86, rightConstant: -253)
    NSLayoutConstraint.activate([
      nextButtonIcon.bottomAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 60),
      nextButtonIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
      nextButtonIcon.heightAnchor.constraint(equalToConstant: 50),
      nextButtonIcon.widthAnchor.constraint(equalToConstant: 50),
      imageView.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
      imageView.heightAnchor.constraint(equalToConstant: 5)
    ])
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
