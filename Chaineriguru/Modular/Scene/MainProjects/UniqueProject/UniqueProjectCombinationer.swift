//
//  UniqueProjectCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import Foundation
import UIKit

class UniqueProjectCombinationer {
    private let collector: UniqueProjectCollector = UniqueProjectCollector()
    private let uniqueProjectDefaults = UserDefaults.standard
    private let storageGuruCombinationer = StorageGuruCombinationer.sharedStorage
    
    func setUniqueProjectMainViewComponent(_ uniqueVisual: UIImageView, _ uniqueLabel: UILabel, _ optionMenu: UIButton, _ visualView: UIView, _ goalAdding: UIButton, _ mainUniqueView: UIView, _ noGoals: UILabel) {
        uniqueVisual.image = collector.uniqueVisual
        uniqueLabel.text = collector.uniqueProjectCaption
        optionMenu.setImage(collector.uniqueMenuVisual, for: .normal)
        visualView.layer.cornerRadius = 10
        goalAdding.setTitle(collector.addUniqueGoalCaption, for: .normal)
        goalAdding.layer.cornerRadius = 10
        noGoals.text = collector.noCreatedGoalsCaption
        mainUniqueView.isHidden = true
    }
    
    func setupUniqueMainViewWithComponents(_ uniqueView: UIView, _ additionView: UIView, _ uniqueGoalsViews: [UIView]) {
        uniqueView.isHidden = false
        additionView.layer.cornerRadius = 10
        for uniqueGoalsView in uniqueGoalsViews {
            preintergrateCustomVisualViewBorder(uniqueGoalsView)
        }
    }
    
    func preinitializeAdditionalGoalView(_ goalView: UIView, _ additionalView: UIView, _ deleteGoal: UIButton, _ yourGoal: UILabel, _ yourGoalName: UILabel, _ additionalGoals: UILabel, _ shutDownGoal: UIButton, _ additionalYourGoals: [UIView]) {
        goalView.isHidden = false
        additionalView.layer.cornerRadius = 10
        deleteGoal.setImage(collector.deleteUniqueGoalVisual, for: .normal)
        yourGoal.text = collector.yourGoalCaption
        yourGoalName.text = collector.uniqueGoalNameCaption
        additionalGoals.text = collector.additionalYourGoalsCaption
        shutDownGoal.setTitle(collector.uniqueGoalCloseCaption, for: .normal)
        shutDownGoal.layer.cornerRadius = 10
        for additionalYourGoal in additionalYourGoals {
            preintergrateCustomVisualViewBorder(additionalYourGoal)
        }
    }
    
    func prelocalizeUniqueMainViewWithTextData(_ uniqueTitle: UILabel, _ goalName: UILabel, _ additionalGoals: UILabel, _ closeGoal: UIButton, _ setGoal: UIButton) {
        uniqueTitle.text = collector.uniqueGoalTitleCaption
        goalName.text = collector.uniqueGoalNameCaption
        additionalGoals.text = collector.additionalGoalsCaption
        closeGoal.layer.cornerRadius = 10
        setGoal.layer.cornerRadius = 10
        closeGoal.setTitle(collector.uniqueGoalCloseCaption, for: .normal)
        setGoal.setTitle(collector.uniqueGoalSetCaption, for: .normal)
    }
    
    func configureUniqueProjectsTextFields(_ goalsNameTextFields: [UITextField], _ goalsSumTextFields: [UITextField], _ uniqueNameTextField: UITextField, _ viewComponent: UniqueProjectViewComponent) {
        for goalsNameTextField in goalsNameTextFields {
            goalsNameTextField.delegate = viewComponent
            goalsNameTextField.attributedPlaceholder = NSAttributedString(
                string: collector.emptyUniqueNameCaption,
                attributes: [NSAttributedString.Key.foregroundColor: collector.uniqueGoalCustomColor]
            )
        }
        for goalsSumTextField in goalsSumTextFields {
            goalsSumTextField.delegate = viewComponent
            goalsSumTextField.keyboardType = .numberPad
            goalsSumTextField.attributedPlaceholder = NSAttributedString(
                string: collector.noSumUniqueCaption,
                attributes: [NSAttributedString.Key.foregroundColor: collector.uniqueGoalCustomColor]
            )
        }
        uniqueNameTextField.delegate = viewComponent
        uniqueNameTextField.attributedPlaceholder = NSAttributedString(
            string: collector.newGoalUniquePlaceholderCaption,
            attributes: [NSAttributedString.Key.foregroundColor: collector.uniqueGoalCustomColor]
        )
    }
    
    func checkUniqueProjectSelectedVisual(_ emptyVisual: UIImageView, _ selectLabel: UILabel, _ selectButton: UIButton, _ selectedVisual: UIImageView) {
        if let imagePath = uniqueProjectDefaults.string(forKey: "selectedUniqueUserVisual"),
           let image = UIImage(contentsOfFile: imagePath) {
            emptyVisual.isHidden = true
            selectLabel.isHidden = true
            selectButton.isHidden = true
            selectedVisual.isHidden = false
            selectedVisual.image = image
        } else {
            print("No image found")
            emptyVisual.isHidden = false
            selectLabel.isHidden = false
            selectButton.isHidden = false
            selectedVisual.isHidden = true
        }
    }
    
    func insetupUniqueProjectTableViewConnection(_ viewComponent: UniqueProjectViewComponent, _ tableView: UITableView, _ sepStyle: UITableViewCell.SeparatorStyle ) {
        tableView.delegate = viewComponent
        tableView.backgroundColor = .clear
        tableView.dataSource = viewComponent
        tableView.separatorStyle = sepStyle
        tableView.register(UINib(nibName: "UniqueProjectCell", bundle: nil), forCellReuseIdentifier: "uniqueProjectComponentCell")
    }
    
    func setEmptyUniqueVisualView(_ noVisual: UIImageView, _ emptyVisual: UILabel, _ addVisual: UIButton) {
        noVisual.image = collector.noUniqueVisual
        emptyVisual.text = collector.uniqueSelectionCaption
        addVisual.setTitle(collector.selectUniqueCaption, for: .normal)
        addVisual.layer.cornerRadius = 10
    }
    
    func checkUniqueProjectTotalSavedBudget(_ uniqueBudgetLabel: UILabel, _ budgetProgressView: UIProgressView) {
        if uniqueProjectDefaults.string(forKey: "savedUniqueBudget") != nil {
            uniqueBudgetLabel.text = "\(uniqueProjectDefaults.string(forKey: "savedUniqueBudget") ?? "0") $"
            budgetProgressView.progress = Float.random(in: 0.0...1.0)
        } else {
            uniqueBudgetLabel.text = "0 $"
            budgetProgressView.progress = 0
        }
    }
    
    func inpresentUniqueProjectReminderViewComponent(isSetting: Bool, viewComponent: UniqueProjectViewComponent) {
        if isSetting {
            viewComponent.interactViewComponentAlertWithInputData(collector.reminderTrueTitleCaption, componentAlertMessage: collector.reminderTrueMessageCaption)
        } else {
            print("No settings active.")
        }
    }
    
    func makeObservationOfStartupUserName(_ uniqueStartupLabel: UILabel) {
        if uniqueProjectDefaults.string(forKey: "regUserTypeStartup") != nil {
            uniqueStartupLabel.text = "\(uniqueProjectDefaults.string(forKey: "regUserTypeStartup") ?? "Ваш стартап")"
        } else {
            uniqueStartupLabel.text = "Ваш стартап"
        }
    }
    
    func prehandleSelectedUniqueProjectDelete(_ uniqueProject: UniqueGoalProject, _ viewComponent: UniqueProjectViewComponent,  _ completion: @escaping () -> ()) {
        let handledDeletionViewComponent = UIAlertController(title: collector.deleteUniqueProjectTitleCaption, message: collector.deleteUniqueProjectMessageCaption, preferredStyle: .alert)
  
        let deleteUniqueProjectAction = UIAlertAction(title: collector.trueDeleteCaption, style: .default) { _ in
            self.storageGuruCombinationer.predeleteUniqueGoalProjectFromStorage(uniqueGoalProject: uniqueProject)
            completion()
        }
        handledDeletionViewComponent.addAction(deleteUniqueProjectAction)

        let shutDownUniqueProjectAction = UIAlertAction(title: collector.falseDeleteCaption, style: .cancel) { _ in
           print("Unique project was not deleted, action was cancelled!")
        }
        handledDeletionViewComponent.addAction(shutDownUniqueProjectAction)
      
        viewComponent.present(handledDeletionViewComponent, animated: true, completion: nil)
    }
    
    func presetYourGoalsDetailedData(_ yourTitle: String, _ yourOne: String, _ yourTwo: String, _ yourThree: String, _ yourFour: String, _ sumOne: String, _ sumTwo: String, _ sumThree: String, _ sumFour: String, goalName: UILabel, goalFirst: UILabel, goalSecond: UILabel, goalThird: UILabel, goalFourth: UILabel, oneSum: UILabel, twoSum: UILabel, threeSum: UILabel, fourSum: UILabel) {
        goalName.text = yourTitle
        goalFirst.text = yourOne
        goalSecond.text = yourTwo
        goalThird.text = yourThree
        goalFourth.text = yourFour
        oneSum.text = sumOne
        twoSum.text = sumTwo
        threeSum.text = sumThree
        fourSum.text = sumFour
    }
    
    func loadUniqueProjectGoalsFromStorageGuruCombinationer(_ completion: @escaping ([UniqueGoalProject]) -> ()) {
        let fetchedUniqueProjectGoals = storageGuruCombinationer.preloadGeneratedUniqueGoalProjectsFromStorage()
        completion(fetchedUniqueProjectGoals)
    }
    
    func prepareUniqueProjectGoalGeneration(_ uniqueGoal: String, _ uniqueOne: String, _ uniqueTwo: String, _ uniqueThree: String, _ uniqueFour: String, _ goalOneSum: String, _ goalTwoSum: String, _ goalThreeSum: String, _ goalFourSum: String, _ uniqueBudget: String, _ completion: @escaping (UniqueGoalProject) -> ()) {
        if let goalOne = Int(goalOneSum),
           let goalTwo = Int(goalTwoSum),
           let goalThree = Int(goalThreeSum),
           let goalFour = Int(goalFourSum) {
            
            let totalGoalsSum = goalOne + goalTwo + goalThree + goalFour
    
            var currentTotalBudget = uniqueProjectDefaults.integer(forKey: "savedUniqueBudget")
            currentTotalBudget += totalGoalsSum
            let updatedTotalBudgetString = String(currentTotalBudget)
  
            uniqueProjectDefaults.set(updatedTotalBudgetString, forKey: "savedUniqueBudget")
            
            let totalSumOfGoalsString = String(totalGoalsSum)
            
            let uniqueProjectGoalToGenerate = storageGuruCombinationer.pregenerateUniqueGoalProjectFromInputData(uniqueGoal, uniqueOne, uniqueTwo, uniqueThree, uniqueFour, goalOneSum, goalTwoSum, goalThreeSum, goalFourSum, totalSumOfGoalsString)
            storageGuruCombinationer.presetStorageGuruCombinationerContextSaving()
            completion(uniqueProjectGoalToGenerate)
        } else {
            print("Invalid input values for goal sums.")
        }
    }
    
    func preintergrateCustomVisualViewBorder(_ visualView: UIView) {
        visualView.layer.cornerRadius = 10
        visualView.layer.borderWidth = 1
        visualView.layer.borderColor = collector.uniqueGoalCustomColor.cgColor
    }
    
    func previsualizeUniqueProjectExtendedPermissionViewComponent(_ viewComponent: UniqueProjectViewComponent) {
        let extendedViewComponent = UIAlertController(title: collector.uniqueViewComponentTitleCaption,
                                                      message: collector.uniqueViewComponentMessageCaption,
                                                      preferredStyle: .alert)
        
        extendedViewComponent.addAction(UIAlertAction(title: collector.uniqueSettingsCaption, style: .default, handler: { _ in
            if let settingsUrlComponent = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsUrlComponent, options: [:], completionHandler: nil)
            }
        }))
        
        extendedViewComponent.addAction(UIAlertAction(title: collector.closeUniqueCaption, style: .cancel, handler: nil))
        
        
        
        viewComponent.present(extendedViewComponent, animated: true, completion: nil)
    }
    
    func preloadUniqueImageViewComponentPicker(_ viewComponent: UniqueProjectViewComponent) {
        let uniqueViewComponentPicker = UIImagePickerController()
        uniqueViewComponentPicker.delegate = viewComponent
        uniqueViewComponentPicker.sourceType = .photoLibrary
        viewComponent.present(uniqueViewComponentPicker, animated: true, completion: nil)
    }
}
