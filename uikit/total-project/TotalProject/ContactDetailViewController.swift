//
//  ContactDetailViewController.swift
//  TotalProject
//
//  Created by cuongnh5 on 16/10/2023.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
//  MARK: - didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        confiureUI()
        navConfig()
    }
    
    // Create UI
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator  = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let topView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let middleView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let mailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 22.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let avatar: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "lee-sin")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let contentVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let buttonHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("message", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        button.configuration = .gray()
        button.configuration?.image = UIImage(systemName: "message.fill")
        button.configuration?.imagePlacement = .top
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let callButton: UIButton = {
        let button = UIButton()
        button.setTitle("call", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        button.configuration = .gray()
        button.configuration?.image = UIImage(systemName: "phone.fill")
        button.configuration?.imagePlacement = .top
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let videoButton: UIButton = {
        let button = UIButton()
        button.setTitle("video", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        button.configuration = .gray()
        button.configuration?.image = UIImage(systemName: "video.fill")
        button.configuration?.imagePlacement = .top
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let mailButton: UIButton = {
        let button = UIButton()
        button.setTitle("mail", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        button.configuration = .gray()
        button.configuration?.image = UIImage(systemName: "mail.fill")
        button.configuration?.imagePlacement = .top
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.text = "Notes"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let noteDetailLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.text = "Lee Sin, the blind monk, is an iconic melee champion in League of Legends celebrated for his unparalleled martial arts prowess and extraordinary versatility on the Summoner's Rift. His kit is defined by the dynamic use of abilities like Sonic Wave/Resonating Strike, where he dashes toward enemies and unleashes devastating follow-up attacks, and Dragon's Rage, his ultimate, capable of sending a target champion soaring while dealing substantial area damage, making him a game-changer in team fights. Complementing this, his Tempest/Cripple combo offers area-of-effect damage and slows, adding valuable utility. What sets Lee Sin apart is his energy management, which sets him free from the constraints of mana, allowing for a relentless and impactful presence in combat. Often found in the jungle but also effective in the top lane, Lee Sin is a champion of choice for players seeking to showcase their precision in landing skillshots and tactical prowess to outmaneuver opponents, making him a favorite among seasoned players. ------------ Lee Sin, the blind monk, is an iconic melee champion in League of Legends celebrated for his unparalleled martial arts prowess and extraordinary versatility on the Summoner's Rift. His kit is defined by the dynamic use of abilities like Sonic Wave/Resonating Strike, where he dashes toward enemies and unleashes devastating follow-up attacks, and Dragon's Rage, his ultimate, capable of sending a target champion soaring while dealing substantial area damage, making him a game-changer in team fights. Complementing this, his Tempest/Cripple combo offers area-of-effect damage and slows, adding valuable utility. What sets Lee Sin apart is his energy management, which sets him free from the constraints of mana, allowing for a relentless and impactful presence in combat. Often found in the jungle but also effective in the top lane, Lee Sin is a champion of choice for players seeking to showcase their precision in landing skillshots and tactical prowess to outmaneuver opponents, making him a favorite among seasoned players."
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.contentHorizontalAlignment = .left
        
        button.configuration = .plain()
        button.configuration?.image = UIImage(systemName: "trash.fill")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // Config UI
    func confiureUI() {
        view.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            topView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            topView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        view.addSubview(scrollView)
        scrollView.delegate = self
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        confiureTopView()
        configureMiddleView()
        configureBottomView()
    }
    
    func confiureTopView() {
        topView.addSubview(avatar)
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: topView.topAnchor),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            avatar.centerXAnchor.constraint(equalTo: topView.centerXAnchor)
        ])
        
        topView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        buttonHorizontalStackView.addArrangedSubview(messageButton)
        buttonHorizontalStackView.addArrangedSubview(callButton)
        buttonHorizontalStackView.addArrangedSubview(videoButton)
        buttonHorizontalStackView.addArrangedSubview(mailButton)
        
        topView.addSubview(buttonHorizontalStackView)
        NSLayoutConstraint.activate([
            buttonHorizontalStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            buttonHorizontalStackView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            buttonHorizontalStackView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            buttonHorizontalStackView.heightAnchor.constraint(equalToConstant: 70),
            buttonHorizontalStackView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            buttonHorizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func configureMiddleView() {
        contentView.addSubview(middleView)
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: contentView.topAnchor),
            middleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            middleView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            middleView.heightAnchor.constraint(greaterThanOrEqualToConstant: 700)
        ])
        
        middleView.addSubview(phoneLabel)
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 10),
            phoneLabel.leftAnchor.constraint(equalTo: middleView.leftAnchor),
            phoneLabel.rightAnchor.constraint(equalTo: middleView.rightAnchor),
            phoneLabel.heightAnchor.constraint(equalToConstant: 40),
            phoneLabel.centerXAnchor.constraint(equalTo: middleView.centerXAnchor)
        ])
        
        middleView.addSubview(mailLabel)
        NSLayoutConstraint.activate([
            mailLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            mailLabel.leftAnchor.constraint(equalTo: middleView.leftAnchor),
            mailLabel.rightAnchor.constraint(equalTo: middleView.rightAnchor),
            mailLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        middleView.addSubview(noteLabel)
        NSLayoutConstraint.activate([
            noteLabel.topAnchor.constraint(equalTo: mailLabel.bottomAnchor, constant: 10),
            noteLabel.leftAnchor.constraint(equalTo: middleView.leftAnchor),
            noteLabel.rightAnchor.constraint(equalTo: middleView.rightAnchor),
            noteLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        middleView.addSubview(noteDetailLabel)
        NSLayoutConstraint.activate([
            noteDetailLabel.topAnchor.constraint(equalTo: noteLabel.bottomAnchor, constant: 10),
            noteDetailLabel.leftAnchor.constraint(equalTo: middleView.leftAnchor),
            noteDetailLabel.rightAnchor.constraint(equalTo: middleView.rightAnchor),
            noteDetailLabel.bottomAnchor.constraint(equalTo: middleView.bottomAnchor)
        ])
        
    }
    
    func configureBottomView() {
        contentView.addSubview(bottomView)
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: 10),
            bottomView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            bottomView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        bottomView.addSubview(deleteButton)
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: bottomView.topAnchor),
            deleteButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor),
            deleteButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor)
        ])
        deleteButton.addTarget(self, action: #selector(deteteButtonTaped), for: .touchUpInside)
    }
    
    func navConfig() {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItem = editButton
        
    }
    
    // Action UI
    @objc func deteteButtonTaped() {
        let contact = Contact(name: nameLabel.text!, phoneNumber: phoneLabel.text!, mail: mailLabel.text!, isMain: false)
        
        ContactDataSource.shared.deleteContact(contact)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension ContactDetailViewController: ContactControllerDelegate {
    func passData(_ contact: Contact) {
        self.nameLabel.text = contact.name
        self.phoneLabel.text = contact.phoneNumber
        self.mailLabel.text = contact.mail
    }
}

extension ContactDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        let initialFontSize = 22.0
        let minFontSize = 16.0

        var newFontSize = initialFontSize - (yOffset)

        if newFontSize < minFontSize {
            newFontSize = minFontSize
        }
        
        nameLabel.font = .systemFont(ofSize: newFontSize)

        let initialHeight: CGFloat = 200
        let minHeight: CGFloat = 170

        var newHeight = initialHeight - yOffset
        
        if newHeight < minHeight {
            newHeight = minHeight
        }
    
        for contrains in topView.constraints {
            if contrains.firstAttribute == .height {
                contrains.constant = newHeight
                break
            }
        }
        
        
    }
    
}
