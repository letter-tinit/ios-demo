//
//  ContactController.swift
//  TotalProject
//
//  Created by cuongnh5 on 12/10/2023.
//

import UIKit

protocol ContactControllerDelegate {
    func passData(_ contact: Contact)
}

public struct Contact: Codable, Equatable {
    let name: String
    let phoneNumber: String
    let mail: String
    let isMain: Bool
}

class ContactDataSource {
    static let shared = ContactDataSource()
    init() {}
    
    var contacts: [Contact] = []
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
        NotificationCenter.default.post(name: .addNewContact, object: nil, userInfo: ["contact": contact])
    }
    
    func deleteContact(_ contact: Contact) {
        if let index = contacts.firstIndex(where: { $0 == contact } ) {
            print(contacts.remove(at: index))
        }
        
        NotificationCenter.default.post(name: .deleteContact, object: nil, userInfo: ["contact": contact])
    }
    
    func getContactData(completion: @escaping () -> Void) {
        let apiURL = URL(string: "https://f10d6019-5422-4471-93c8-0955f4daaeaa.mock.pstmn.io/get-contact")
        
        let session = URLSession.shared
        let task = session.dataTask(with: apiURL!) { [weak self] (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                self?.contacts = try decoder.decode([Contact].self, from: data)
                completion()
            } catch let error {
                print("JSON decoding error: \(error)")
            }
        }
        
        task.resume()
    }
}

class ContactController: UIViewController {
    var delegate: ContactControllerDelegate?
    
    var contacts: [Contact] = []
    var contactDatasource: ContactDataSource = ContactDataSource()
    var sections: [[Contact]] = []
    var filteredContacts = [Contact]()
    var inSearchMode = false
    
    private let contactView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = "Hello"
        searchBar.tintColor = UIColor.black
        searchBar.barTintColor = UIColor.systemBackground
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navConfig()
        
        setUpdata()
        
        view.addSubview(searchBar)
        setUpSearchBarContrains()
        searchBar.delegate = self
        
        view.addSubview(contactView)
        
        setUpContactViewContrains()
        
        contactView.delegate = self
        contactView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewContactAdded(_:)), name: .addNewContact, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleDeleteContact(_:)), name: .deleteContact, object: nil)
    }
    
    @objc func handleDeleteContact(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            if let contact = userInfo["contact"] as? Contact {
                if let index = contacts.firstIndex(where: { $0 == contact } ) {
                    print(contacts.remove(at: index))
                }
                
                if let firstCharacter = contact.name.first {
                    if let index = sections.firstIndex(where: {
                        $0.first?.name.first == firstCharacter
                    }) {
                        if let subIndex = sections[index].firstIndex(where: { $0 == contact } ) {
                            if sections[index].count <= 1 {
                                sections[index].remove(at: subIndex)
                                sections.remove(at: index)
                            } else {
                                sections[index].remove(at: subIndex)
                            }

                        }
                    }
                }
                
            }
        }
        
        DispatchQueue.main.async {
            self.contactView.reloadData()
        }
    }
    
    @objc func handleNewContactAdded(_ notification: Notification) {
        
        if let userInfo = notification.userInfo {
            if let contact = userInfo["contact"] as? Contact {
                contacts.append(contact)
                //                updateTableData()
                if let firstCharacter = contact.name.first {
                    if let index = sections.firstIndex(where: {
                        $0.first?.name.first == firstCharacter && $0.first?.isMain == false
                    }) {
                        sections[index].append(contact)
                    } else {
                        sections.append([contact])
                    }
                }
            }
        }
        
        DispatchQueue.main.async {
            self.contactView.reloadData()
        }
    }
    
    
    func navConfig() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        let navAddContactViewController = UINavigationController(rootViewController: AddContactViewController())
        self.present(navAddContactViewController, animated: true, completion: nil)
    }
    
    func setUpSearchBarContrains() {
        
        let searchBarContrains = [
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(searchBarContrains)
    }
    
    func setUpContactViewContrains() {
        let contactViewContrains = [
            contactView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            contactView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contactView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        NSLayoutConstraint.activate(contactViewContrains)
    }
    
    func setUpdata() {
        contactDatasource.getContactData { [weak self] in
            self?.updateTableData()
        }
    }
    
    func updateTableData() {
        contacts = contactDatasource.contacts
        
        var mainContact: Contact?
        if let index = contacts.firstIndex(where: { $0.isMain } ) {
            mainContact = contacts.remove(at: index)
        }
        
        let sortedContacts = contacts.sorted {
            $0.name < $1.name
        }
        
        if let mainContact = mainContact {
            sections.append([mainContact])
        }
        
        for contact in sortedContacts {
            
            if let firstCharacter = contact.name.first {
                if let index = sections.firstIndex(where: {
                    $0.first?.name.first == firstCharacter && $0.first?.isMain == false
                }) {
                    sections[index].append(contact)
                } else {
                    sections.append([contact])
                }
            }
        }
        DispatchQueue.main.async {
            self.contactView.reloadData()
        }
    }
    
}

extension ContactController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if inSearchMode {
            return 1
        }
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return self.filteredContacts.count
        }
        
        if section == 0 {
            return 1
        }
        
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as? ContactTableViewCell else {
            return UITableViewCell()
        }
        
        var contact: Contact
        
        if inSearchMode {
            contact = filteredContacts[indexPath.row]
        } else {
            contact = sections[indexPath.section][indexPath.row]
        }
        
        cell.nameLabel?.text = contact.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if inSearchMode {
            return " "
        }
        
        if let contact = sections[section].first {
            if contact.isMain {
                return " "
            }
        }
        
        let firstCharacter = String(sections[section].first?.name.prefix(1) ?? "")
        return firstCharacter
    }
    
}

extension ContactController: UITableViewDelegate {
    //    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    //        return Array(sections)
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact: Contact
        if inSearchMode {
            contact = filteredContacts[indexPath.row]
        } else {
            contact = sections[indexPath.section][indexPath.row]
        }
        //        let contact = sections[indexPath.section][indexPath.row]
        let contactDetailController = ContactDetailViewController()
        self.delegate = contactDetailController
        
        delegate?.passData(contact)
        self.navigationController?.pushViewController(contactDetailController, animated: true)
    }
    
    
}

extension ContactController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //        print("searchBarTextDidBeginEditing")
        self.searchBar.showsCancelButton = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        print("searchBar")
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            self.searchBar.showsCancelButton = false
            self.contactView.reloadData()
        } else {
            inSearchMode = true
            //            print("\(searchText)")
            filteredContacts = contacts.filter({( cus : Contact) -> Bool in
                cus.name.lowercased().contains(searchText.lowercased())
            })
            self.contactView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //        print("searchBarCancelButtonClicked")
        self.view.endEditing(true)
        self.searchBar.showsCancelButton = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //        print("searchBarSearchButtonClicked")
    }
}

