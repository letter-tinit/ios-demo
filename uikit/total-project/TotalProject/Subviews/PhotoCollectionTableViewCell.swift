//
//  PhotoCollectionTableViewCell.swift
//  TotalProject
//
//  Created by cuongnh5 on 12/10/2023.
//

import UIKit

class PhotoCollectionTableViewCell: UITableViewCell {
    static let identifier = "PhotoCollectionTableViewCell"
    
    var cards: [String] = []
    
    private let collectionView: UICollectionView = {
        var imageView: UIImageView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
//        applyContrains()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func applyContrains() {
        let collectionViewContrains = [
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 80.0)
        ]
        
        let tableViewCellContrains = [
            contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0)
        ]
        
        NSLayoutConstraint.activate(collectionViewContrains)
        NSLayoutConstraint.activate(tableViewCellContrains)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    func configure(with cards: [String]?) {
        self.cards = cards ?? [""]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
}

extension PhotoCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        let cardName = cards[indexPath.row]
        cell.imageView.image = UIImage(named: cardName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
}
