//
//  ViewController.swift
//  contraints
//
//  Created by Luat on 2/10/21.
//

import UIKit

class ViewController: UIViewController {

    let greyView: UIView = {
        let closureView = UIView()
        closureView.backgroundColor = .systemGray
        return closureView
    }()
    
    let leftView: UIImageView = {
        let closureView = UIImageView()
        closureView.backgroundColor = .cyan
        closureView.image = UIImage(systemName: "pencil")
        return closureView
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.text = "This is a sentence to be displayed"
        label.numberOfLines = 0
        return label
    }()
    
    let bottomLabel: UILabel = {
        let bottomLabel = UILabel()
        bottomLabel.backgroundColor = .yellow
        bottomLabel.text =
            """
                This
                is a bunch
                of text and I want
                this to be a long sentence and there will be a lot of word and need to be like 100 words long
                """
        bottomLabel.numberOfLines = 0
        bottomLabel.adjustsFontSizeToFitWidth = true
        bottomLabel.minimumScaleFactor = 0.7
        return bottomLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(greyView, leftView, topLabel, bottomLabel)
        setupAllConstraints()
    }
    
    func setupAllConstraints() {
        func setupGreyViewConstraints() {
            greyView.translatesAutoresizingMaskIntoConstraints = false
            greyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            greyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            greyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            greyView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        }
        func setupLeftViewConstraints() {
            leftView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                leftView.leadingAnchor.constraint(equalTo: greyView.leadingAnchor, constant: 10),
                leftView.topAnchor.constraint(equalTo: greyView.topAnchor, constant: 10),
                leftView.widthAnchor.constraint(equalTo: greyView.widthAnchor, multiplier: 0.4),
                leftView.bottomAnchor.constraint(equalTo: greyView.bottomAnchor, constant: -10)
            ])
        }
        func setupTopLabelConstraints() {
            topLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                topLabel.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 10),
                topLabel.topAnchor.constraint(equalTo: leftView.topAnchor),
                topLabel.trailingAnchor.constraint(equalTo: greyView.trailingAnchor, constant: -10),
                topLabel.heightAnchor.constraint(equalTo: leftView.heightAnchor, multiplier: 0.4)
            ])
        }
        func setupBottomLabelConstraints() {
            bottomLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                bottomLabel.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 10),
                bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
                bottomLabel.trailingAnchor.constraint(equalTo: greyView.trailingAnchor, constant: -10),
                bottomLabel.bottomAnchor.constraint(equalTo: greyView.bottomAnchor, constant: -10)
            ])
        }
        
        setupGreyViewConstraints()
        setupLeftViewConstraints()
        setupTopLabelConstraints()
        setupBottomLabelConstraints()
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
