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
            
    private var data: Recipe?
    
    @IBOutlet private weak var avatarFoodImage: UIImageView!
    @IBOutlet private weak var summaryTextView: UITextView!
    @IBOutlet private weak var nameFoodLabel: UILabel!
    @IBOutlet private weak var moneyLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var goToIngredientButton: UIButton!
    @IBOutlet private weak var goToInstructionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetail()
        configCell()
    }
    
    @IBAction func goToInstruction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Constant.Storyboard.instruction, bundle: nil)
        if let instructionVC = storyboard.instantiateViewController(withIdentifier: Constant.Identifier.instructionViewController) as?
            InstructionViewController,
            let newData = data {
            
            navigationController?.pushViewController(instructionVC, animated: true)
            instructionVC.takeInstructionData(newData.analyzedInstructions)
        }
    }
    
    @IBAction private func goToIngredient(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Constant.Storyboard.ingredient, bundle: nil)
        if let ingredientVC = storyboard.instantiateViewController(
            withIdentifier: Constant.Identifier.ingredientViewController) as?
            IngredientViewController,
            let newData = data {
            
            navigationController?.pushViewController(ingredientVC, animated: true)
            ingredientVC.takeIngredientData(newData)
        }
    }
    
    @IBAction private func addToFavorite(_ sender: UIBarButtonItem) {
        
    }
    
    func takeData(_ data: Recipe) {
        self.data = data
    }
    
    func setDetail() {
        let url = URL(string: "\(data?.image ?? "")")
        nameFoodLabel.text = data?.title
        avatarFoodImage.kf.setImage(with: url)
        summaryTextView.text = data?.summary.htmlToString
        moneyLabel.text = "$: \(data?.pricePerServing ?? 0.0)"
        timeLabel.text = "Time: \(data?.readyInMinutes ?? 0)"
        scoreLabel.text = "\(data?.spoonacularScore ?? 0)"
    }
    
    func configCell() {
        summaryTextView.isEditable = false
        nameFoodLabel.wrapContent()
        avatarFoodImage.makeRoundCorner()
        goToIngredientButton.makeRoundCorner()
        goToInstructionButton.makeRoundCorner()
    }
}
