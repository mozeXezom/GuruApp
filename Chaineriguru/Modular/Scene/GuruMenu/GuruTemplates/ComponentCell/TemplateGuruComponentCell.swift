//
//  TemplateGuruComponentCell.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 20.02.2024.
//

import UIKit

class TemplateGuruComponentCell: UITableViewCell {

    @IBOutlet weak var templateCellView: UIView!
    @IBOutlet weak var guruTemplateNameLabel: UILabel!
    @IBOutlet weak var guruTemplateVisual: UIImageView!
    @IBOutlet weak var totalBudgetTemplateLabel: UILabel!
    @IBOutlet weak var firstGoalLabel: UILabel!
    @IBOutlet weak var secondGoalLabel: UILabel!
    @IBOutlet weak var thirdGoalLabel: UILabel!
    @IBOutlet weak var firstBudgetLabel: UILabel!
    @IBOutlet weak var secondBudgetLabel: UILabel!
    @IBOutlet weak var thirdBudgetLabel: UILabel!
    @IBOutlet var templateGuruProgressViews: [UIProgressView]!
    
    func extendTemplateGuruComponentCellWithSavedData(_ savedTemplateData: GuruTemplatesModel) {
        templateCellView.layer.cornerRadius = 10
        guruTemplateNameLabel.text = savedTemplateData.titleOfGuruTemplate
        guruTemplateVisual.image = savedTemplateData.guruTemplateVisualPic
        totalBudgetTemplateLabel.text = savedTemplateData.totalBudgetGuru
        firstGoalLabel.text = savedTemplateData.firstGuruGoal
        secondGoalLabel.text = savedTemplateData.secondGuruGoal
        thirdGoalLabel.text = savedTemplateData.thirdGuruGoal
        firstBudgetLabel.text = savedTemplateData.firstBudget
        secondBudgetLabel.text = savedTemplateData.secondBudget
        thirdBudgetLabel.text = savedTemplateData.thirdBudget
        
        for templateGuruProgressView in templateGuruProgressViews {
            templateGuruProgressView.progressTintColor = savedTemplateData.progressGuruColor
        }
    }
    
    func preloadTemplateProgressViews() {
        for preloadedProgressView in templateGuruProgressViews {
            preloadedProgressView.progress = Float.random(in: 0.0...1.0)
        }
    }
}
