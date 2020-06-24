//
//  TipsViewController.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/4/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit
import Then
import Kingfisher
    
final class DetailViewController: UIViewController, UICollectionViewDelegate {
            
    var data: Recipe!
    
    @IBOutlet private weak var avatarFood: UIImageView!
    @IBOutlet private weak var summary: UITextView!
    @IBOutlet private weak var nameFood: UILabel!
    @IBOutlet private weak var money: UILabel!
    @IBOutlet private weak var time: UILabel!
    @IBOutlet private weak var score: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetail()
    }
    
    @IBAction private func goToIngredient(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Ingredient", bundle: nil)
        let ingredientVC = storyboard.instantiateViewController(withIdentifier: Constant.Identifier.ingredientViewController)
        navigationController?.pushViewController(ingredientVC, animated: true)
    }
    
    @IBAction private func likeBtn(_ sender: UIBarButtonItem) {
        
    }
    
    func takeData(_ data: Recipe) {
        self.data = data
    }
    
    func setDetail() {
        let url = URL(string: "\(data.image)")
        nameFood.text = data.title
        avatarFood.kf.setImage(with: url)
        avatarFood.layer.cornerRadius = avatarFood.frame.height / 10
        summary.text = data.summary.htmlToString
        money.text = "$: \(data.pricePerServing)"
        time.text = "Time: \(data.readyInMinutes)"
        score.text = "\(data.spoonacularScore)"
        button.layer.cornerRadius = button.frame.height / 10
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
