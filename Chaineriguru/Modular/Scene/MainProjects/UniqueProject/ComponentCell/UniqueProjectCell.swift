//
//  UniqueProjectCell.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 21.02.2024.
//

import UIKit

class UniqueProjectCell: UITableViewCell {

    @IBOutlet weak var uniqueView: UIView!
    @IBOutlet weak var uniqueGoalTitleLabel: UILabel!
    @IBOutlet weak var projectDotsImageView: UIImageView!
    @IBOutlet weak var goalUniqueProgressView: UIProgressView!
    @IBOutlet weak var goalUniqueBudgetLabel: UILabel!
    
    func preloadUniqueProjectCellWithReceivedData(_ uniqueProjectGoalsData: UniqueGoalProject, _ dotsVisual: UIImage) {
        uniqueView.layer.cornerRadius = 10
        projectDotsImageView.image = dotsVisual
        uniqueGoalTitleLabel.text = uniqueProjectGoalsData.uniqueName
        goalUniqueBudgetLabel.text = "Общий бюджет цели: \(uniqueProjectGoalsData.totalUniqueBudget ?? "0") $"
        goalUniqueProgressView.progress = Float.random(in: 0.0...1.0)
    }
}
