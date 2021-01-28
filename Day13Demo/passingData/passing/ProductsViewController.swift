//
//  ProductsViewController.swift
//  passing
//
//  Created by Luat on 1/27/21.
//

import UIKit

class ProductsViewController: UIViewController, HasUser {
    var user: User?
    var delegate: UpdateUserDelegate?
    @IBAction func buy(_ sender: UIButton) {
        user?.buyOneDrink()
        spentLabel.text = String(user?.drinksBought ?? 0)
//        if let vc = delegate as? HomeViewController {
//            vc.updateUser(user: user)
//        }
        delegate?.updateUser(user: user)
    }
    @IBOutlet weak var spentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        updateUI()
    }

    func updateUI() {
        nameLabel.text = user?.name
        spentLabel.text = String(user?.drinksBought ?? 0)
    }
}

extension ProductsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: rand(), green: randAlpha(), blue: randAlpha(), alpha: randAlpha())
        return cell

    }
    func rand() -> CGFloat {
        return CGFloat.random(in: (0...1))
    }
    func randAlpha() -> CGFloat {
        return CGFloat.random(in: (0.6...1))
    }
}
