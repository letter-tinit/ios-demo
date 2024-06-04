//
//  PhotoViewController.swift
//  TotalProject
//
//  Created by cuongnh5 on 12/10/2023.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var cardData: [Character: [String]] = [:]
    var sections: [Character] = ["H", "D", "C", "S"]
    
    func loadCardData() {
        cardData["C"] = ["AC", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC"]
        cardData["D"] = ["AD", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD"]
        cardData["H"] = ["AH", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "JH", "QH", "KH"]
        cardData["S"] = ["AS","2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "JS", "QS", "KS"]
    }
    
    private let photoTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(PhotoCollectionTableViewCell.self, forCellReuseIdentifier: PhotoCollectionTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCardData()
//        sections = Array(cardData.keys).sorted()
        
        view.addSubview(photoTable)
        
        photoTable.delegate = self
        photoTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        photoTable.frame = view.bounds
    }
    
}

extension PhotoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let character = sections[section]
        switch character {
            case "C":
                return "Club"
            case "D":
                return "Diamond"
            case "H":
                return "Heart"
            case "S":
                return "Spade"
            default:
                return " "
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 215
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCollectionTableViewCell.identifier, for: indexPath) as? PhotoCollectionTableViewCell else {
            return UITableViewCell()
        }
        let sectionKey = sections[indexPath.section]
        if let cardsInSection = cardData[sectionKey] {
            cell.configure(with: cardsInSection)
        }
        return cell
    }
}

extension PhotoViewController: UITableViewDelegate {
    
}
