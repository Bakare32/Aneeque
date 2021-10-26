//
//  DetailsViewController.swift
//  Aneeque
//
//  Created by  Decagon on 26/10/2021.
//

import UIKit

class DetailsViewController: UIViewController {

    private func loveButton() {
        let customButton = UIButton.init(frame: CGRect.init(x: 10, y: 10, width: 30, height: 30))
            customButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
        customButton.tintColor = .red
        customButton.backgroundColor = .white
        customButton.layer.cornerRadius = 12
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: customButton)
        let customButton2 = UIButton.init(frame: CGRect.init(x: 10, y: 10, width: 30, height: 30))
            customButton2.setImage(UIImage.init(systemName: "chevron.left"), for: .normal)
        customButton2.tintColor = .black
        customButton2.backgroundColor = .white
        customButton2.layer.cornerRadius = 12
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: customButton2)
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
//        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let detailView: UIView = {
      let view = UIView()
//        view.backgroundColor = .red
        view.layer.cornerRadius = 55
        let preferenceLabel: UILabel = {
        let label = UILabel()
        label.text = "Irun Chair"
       label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
//      let preferenceImage: UIImageView = {
//        let imageView = UIImageView.makeSettingsImage()
//        imageView.image = AppButtonImages.preferences.image
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//      }()
//      let preferenceLabel: UILabel = {
//        let label = UILabel.makeSettingslabel()
//        label.text = "Preferences"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//      }()
//      let preferenceButton: UIButton = {
//        let button = UIButton.makeSettingsButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//  //      button.addTarget(self, action: #selector(goToPreferenceScreen), for: .touchUpInside)
//        return button
//      }()
//      view.addSubview(preferenceImage)
      view.addSubview(preferenceLabel)
//      view.addSubview(preferenceButton)
        NSLayoutConstraint.activate([
            preferenceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            preferenceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        ])
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         loveButton()
        view.backgroundColor = UIColor(red: 0.7569, green: 0.7451, blue: 0.7412, alpha: 1.0)
        setUpViews()
    }
    
    
    func setUpViews() {
        view.addSubview(imageView)
        view.addSubview(detailView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            detailView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.43)
        ])
    }

}
