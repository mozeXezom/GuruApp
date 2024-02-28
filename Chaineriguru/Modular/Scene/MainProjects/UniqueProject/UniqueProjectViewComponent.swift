//
//  UniqueProjectViewComponent.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 19.02.2024.
//

import UIKit
import Foundation
import Photos

class UniqueProjectViewComponent: UIViewController {
    
    @IBOutlet weak var uniqueProjectImageView: UIImageView!
    @IBOutlet weak var uniqueProjectTitleLabel: UILabel!
    @IBOutlet weak var optionMenuOpenButton: UIButton!
    @IBOutlet weak var uniqueMainView: UIView!
    @IBOutlet weak var uniqueStartupTitleLabel: UILabel!
    @IBOutlet weak var emptyStartupVisualImageView: UIImageView!
    @IBOutlet weak var addStartupVisualLabel: UILabel!
    @IBOutlet weak var selectVisualForStartupButton: UIButton!
    @IBOutlet weak var allStartupBudgetLabel: UILabel!
    @IBOutlet weak var selectedUniqueVisual: UIImageView!
    @IBOutlet weak var uniqueGoalAddingButton: UIButton!
    @IBOutlet weak var uniqueProjectTableView: UITableView!
    
    @IBOutlet weak var newUniqueGoalView: UIView!
    @IBOutlet weak var mainUniqueGoalView: UIView!
    @IBOutlet weak var uniqueGoalTitleLabel: UILabel!
    @IBOutlet weak var uniqueGoalNameLabel: UILabel!
    @IBOutlet weak var uniqueGoalNameTextField: UITextField!
    @IBOutlet weak var goalUniqueProgressView: UIProgressView!
    
    @IBOutlet weak var restUniqueGoalsLabel: UILabel!
    @IBOutlet var newUniqueGoalsViews: [UIView]!
    @IBOutlet weak var goalOneNameTextField: UITextField!
    @IBOutlet weak var goalOneSumTextField: UITextField!
    
    @IBOutlet weak var goalTwoNameTextField: UITextField!
    @IBOutlet weak var goalTwoSumTextField: UITextField!
    
    @IBOutlet weak var goalThreeNameTextField: UITextField!
    @IBOutlet weak var goalThreeSumTextField: UITextField!
    
    @IBOutlet weak var goalFourNameTextField: UITextField!
    @IBOutlet weak var goalFourSumTextField: UITextField!
    
    @IBOutlet weak var closeNewUniqueGoalButton: UIButton!
    @IBOutlet weak var setNewUniqueGoalButton: UIButton!
    @IBOutlet var uniqueGoalsTextFields: [UITextField]!
    @IBOutlet var uniqueSumTextFields: [UITextField]!
    
    @IBOutlet weak var detailedGoalsView: UIView!
    @IBOutlet weak var informativeGoalsView: UIView!
    @IBOutlet weak var yourGoalLabel: UILabel!
    @IBOutlet weak var deleteYourGoalButton: UIButton!
    @IBOutlet weak var yourGoalNameTitleLabel: UILabel!
    @IBOutlet weak var yourGoalNameLabel: UILabel!
    @IBOutlet weak var additionalGoalsLabel: UILabel!
    
    @IBOutlet weak var additionalOneLabel: UILabel!
    @IBOutlet weak var additionalTwoLabel: UILabel!
    @IBOutlet weak var additionalThreeLabel: UILabel!
    @IBOutlet weak var additionalFourLabel: UILabel!
    @IBOutlet var additionalYourGoalsViews: [UIView]!
    
    @IBOutlet weak var sumExtraOneLabel: UILabel!
    @IBOutlet weak var sumExtraTwoLabel: UILabel!
    @IBOutlet weak var sumExtraThreeLabel: UILabel!
    @IBOutlet weak var sumExtraFourLabel: UILabel!
    @IBOutlet weak var shutDownYourGoalViewButton: UIButton!
    @IBOutlet weak var noCreatedGoalsLabel: UILabel!
    
    private let routeCenter: UniqueProjectRouteCenter = UniqueProjectRouteCenter()
    private let combinationer: UniqueProjectCombinationer = UniqueProjectCombinationer()
    private var uniqueProjectGoals: [UniqueGoalProject] = []
    private var selectedUniqueProject: UniqueGoalProject?

    override func viewDidLoad() {
        super.viewDidLoad()
        extentUniqueProjectCombinationerWithData()
    }
    
    private func extentUniqueProjectCombinationerWithData() {
        combinationer.checkUniqueProjectSelectedVisual(emptyStartupVisualImageView, addStartupVisualLabel, selectVisualForStartupButton, selectedUniqueVisual)
        combinationer.insetupUniqueProjectTableViewConnection(self, uniqueProjectTableView, .none)
        combinationer.setUniqueProjectMainViewComponent(uniqueProjectImageView, uniqueProjectTitleLabel, optionMenuOpenButton, uniqueMainView, uniqueGoalAddingButton, mainUniqueGoalView, noCreatedGoalsLabel)
        combinationer.setEmptyUniqueVisualView(emptyStartupVisualImageView, addStartupVisualLabel, selectVisualForStartupButton)
        combinationer.checkUniqueProjectTotalSavedBudget(allStartupBudgetLabel, goalUniqueProgressView)
        combinationer.makeObservationOfStartupUserName(uniqueStartupTitleLabel)
        preobserveUniqueProjectGoalsData()
    }
    
    @IBAction func optionMenuOpenWithTap(_ sender: UIButton) {
        routeCenter.openNextRouteToOptionMenuViewComponent(self)
    }
    
    @IBAction func selectVisualForStartupWithTap(_ sender: UIButton) {
        callPermissionViewComponentForStartupVisualSelection()
    }
    
    @IBAction func uniqueGoalAddingWithTap(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.2, options: .transitionCrossDissolve, animations: { [self] in
            combinationer.setupUniqueMainViewWithComponents(mainUniqueGoalView, newUniqueGoalView, newUniqueGoalsViews)
            combinationer.prelocalizeUniqueMainViewWithTextData(uniqueGoalTitleLabel, uniqueGoalNameLabel, restUniqueGoalsLabel, closeNewUniqueGoalButton, setNewUniqueGoalButton)
            combinationer.configureUniqueProjectsTextFields(uniqueGoalsTextFields, uniqueSumTextFields, uniqueGoalNameTextField, self)
        }, completion: nil)
    }
    
    @IBAction func closeNewUniqueGoalWithTap(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.2, options: .transitionCrossDissolve, animations: { [self] in
            mainUniqueGoalView.isHidden = true
        }, completion: nil)
    }
    
    @IBAction func setNewUniqueGoalWithTap(_ sender: UIButton) {
        if uniqueGoalNameTextField.text!.isEmpty || goalOneNameTextField.text!.isEmpty || goalOneSumTextField.text!.isEmpty || goalTwoNameTextField.text!.isEmpty || goalTwoSumTextField.text!.isEmpty || goalThreeNameTextField.text!.isEmpty || goalThreeSumTextField.text!.isEmpty || goalFourNameTextField.text!.isEmpty || goalFourSumTextField.text!.isEmpty {
            combinationer.inpresentUniqueProjectReminderViewComponent(isSetting: true, viewComponent: self)
        } else {
            let totalGoalsSum = (goalOneSumTextField.text ?? "1000") +
            (goalTwoSumTextField.text ?? "200") +
            (goalThreeSumTextField.text ?? "750") +
            (goalFourSumTextField.text ?? "100")
            combinationer.prepareUniqueProjectGoalGeneration(uniqueGoalNameTextField.text ?? "", goalOneNameTextField.text ?? "", goalTwoNameTextField.text ?? "", goalThreeNameTextField.text ?? "", goalFourNameTextField.text ?? "", goalOneSumTextField.text ?? "1000", goalTwoSumTextField.text ?? "200", goalThreeSumTextField.text ?? "750", goalFourSumTextField.text ?? "100", totalGoalsSum) { (generatedUniqueNewProjectGoal) in
                self.routeCenter.reloadUniqueProjectViewComponent(self)
            }
        }
    }
    
    @IBAction func deleteYourGoalWithTap(_ sender: UIButton) {
        combinationer.prehandleSelectedUniqueProjectDelete(selectedUniqueProject!, self) {
            self.routeCenter.reloadUniqueProjectViewComponent(self)
        }
    }
    
    @IBAction func shutDownYourGoalWithTap(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.2, options: .transitionCrossDissolve, animations: { [self] in
            detailedGoalsView.isHidden = true
        }, completion: nil)
    }
}

extension UniqueProjectViewComponent: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        uniqueProjectGoals.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let forwardUniqueProjectGoalsData = uniqueProjectGoals[indexPath.row]
        selectedUniqueProject = forwardUniqueProjectGoalsData
        
        UIView.transition(with: self.view, duration: 0.2, options: .transitionCrossDissolve, animations: { [self] in
            combinationer.preinitializeAdditionalGoalView(detailedGoalsView, informativeGoalsView, deleteYourGoalButton, yourGoalLabel, yourGoalNameTitleLabel, additionalGoalsLabel, shutDownYourGoalViewButton, additionalYourGoalsViews)
            combinationer.presetYourGoalsDetailedData(forwardUniqueProjectGoalsData.uniqueName ?? "", forwardUniqueProjectGoalsData.uniqueGoalOne ?? "", forwardUniqueProjectGoalsData.uniqueGoalTwo ?? "", forwardUniqueProjectGoalsData.uniqueGoalThree ?? "", forwardUniqueProjectGoalsData.uniqueGoalFour ?? "", "\(forwardUniqueProjectGoalsData.goalSumOne ?? "") $", "\(forwardUniqueProjectGoalsData.goalSumTwo ?? "") $", "\(forwardUniqueProjectGoalsData.goalSumThree ?? "") $", "\(forwardUniqueProjectGoalsData.goalSumFour ?? "") $", goalName: yourGoalNameLabel, goalFirst: additionalOneLabel, goalSecond: additionalTwoLabel, goalThird: additionalThreeLabel, goalFourth: additionalFourLabel, oneSum: sumExtraOneLabel, twoSum: sumExtraTwoLabel, threeSum: sumExtraThreeLabel, fourSum: sumExtraFourLabel)
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let uniqueProjectCell = tableView.dequeueReusableCell(withIdentifier: "uniqueProjectComponentCell", for: indexPath) as! UniqueProjectCell
        
        uniqueProjectCell.selectionStyle = .none
        
        let fetchedUniqueProjectGoalsData = uniqueProjectGoals[indexPath.row]
        uniqueProjectCell.preloadUniqueProjectCellWithReceivedData(fetchedUniqueProjectGoalsData, UIImage(named: "guruDots")!)
        
        uniqueProjectCell.backgroundColor = .clear
        
        return uniqueProjectCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        95
    }
}

extension UniqueProjectViewComponent: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension UniqueProjectViewComponent: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uniqueStartupVisual = info[.originalImage] as? UIImage {
            selectedUniqueVisual.image = uniqueStartupVisual
            selectedUniqueVisual.isHidden = false
            emptyStartupVisualImageView.isHidden = true
            addStartupVisualLabel.isHidden = true
            selectVisualForStartupButton.isHidden = true

            if let visualData = uniqueStartupVisual.jpegData(compressionQuality: 1.0) {
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                do {
                    let fileURL = documentsURL.appendingPathComponent(UUID().uuidString + ".jpg")
                    try visualData.write(to: fileURL)
                    UserDefaults.standard.set(fileURL.path, forKey: "selectedUniqueUserVisual")
                } catch {
                    print("Error saving visual:", error)
                }
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

fileprivate extension UniqueProjectViewComponent {
    private func preobserveUniqueProjectGoalsData() {
        combinationer.loadUniqueProjectGoalsFromStorageGuruCombinationer { (receivedUniqueProjectGoals) in
            if receivedUniqueProjectGoals.isEmpty {
                self.uniqueProjectTableView.isHidden = true
                self.noCreatedGoalsLabel.isHidden = false
            } else {
                self.noCreatedGoalsLabel.isHidden = true
                self.uniqueProjectTableView.isHidden = false
                self.uniqueProjectGoals = receivedUniqueProjectGoals
                self.uniqueProjectTableView.reloadData()
            }
        }
    }
    
    private func callPermissionViewComponentForStartupVisualSelection() {
        let libraryComponentAuth = PHPhotoLibrary.authorizationStatus()
        
        if libraryComponentAuth == .notDetermined {
            PHPhotoLibrary.requestAuthorization { [weak self] (authComponentStatus) in
                if authComponentStatus == .authorized {
                    DispatchQueue.main.async {
                        self?.combinationer.preloadUniqueImageViewComponentPicker(self!)
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.combinationer.previsualizeUniqueProjectExtendedPermissionViewComponent(self!)
                    }
                }
            }
        } else if libraryComponentAuth == .authorized {
            DispatchQueue.main.async { [self] in
                combinationer.preloadUniqueImageViewComponentPicker(self)
            }
        } else {
            combinationer.previsualizeUniqueProjectExtendedPermissionViewComponent(self)
        }
    }
}
