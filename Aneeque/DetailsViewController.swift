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
        customButton2.addTarget(self, action: #selector(goToHomeController), for: .touchUpInside)
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
        view.layer.cornerRadius = 55
        let preferenceLabel: UILabel = {
        let label = UILabel()
        label.text = "Irun Chair"
       label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
        let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "By Seto"
            label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
       label.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
        
        let messagelabel: UILabel = {
        let label = UILabel()
        label.text = "Crafted with a perfect construction by Seto Febraint and have a balancing ergonomic for humans body. top quality leather in the back of the rest."
        label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
       label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        return label
        }()
        
        let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$122.00"
            label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
       label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
        
        let payButton: UIButton = {
          let button = UIButton()
          button.setTitle("Buy Now", for: .normal)
          button.backgroundColor = UIColor(red: 0.7686, green: 0.2275, blue: 0, alpha: 1.0)
          button.layer.cornerRadius = 19
          button.translatesAutoresizingMaskIntoConstraints = false
          return button
        }()

      view.addSubview(preferenceLabel)
        view.addSubview(detailLabel)
      view.addSubview(messagelabel)
        view.addSubview(priceLabel)
        view.addSubview(payButton)
        NSLayoutConstraint.activate([
            preferenceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            preferenceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            detailLabel.topAnchor.constraint(equalTo: preferenceLabel.bottomAnchor, constant: 5),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            messagelabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 30),
            messagelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            messagelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            messagelabel.heightAnchor.constraint(equalToConstant: 72),
            priceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            priceLabel.heightAnchor.constraint(equalToConstant: 60),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            payButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            payButton.heightAnchor.constraint(equalToConstant: 60),
            payButton.widthAnchor.constraint(equalToConstant: 120),
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
    
    @objc func goToHomeController() {
        navigationController?.popViewController(animated: true)
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
