//
//  ProfileGuruViewComponent.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 20.02.2024.
//

import UIKit
import Photos

class ProfileGuruViewComponent: UIViewController {
    
    @IBOutlet weak var profileGuruImageView: UIImageView!
    @IBOutlet weak var appProfileGuruLabel: UILabel!
    @IBOutlet weak var inMenuButton: UIButton!
    @IBOutlet weak var profileGuruView: UIView!
    
    @IBOutlet weak var titleOfProfileLabel: UILabel!
    @IBOutlet weak var visualOfProfileImageView: UIImageView!
    
    @IBOutlet weak var personalInfoLabel: UILabel!
    @IBOutlet weak var profileGuruNameLabel: UILabel!
    @IBOutlet weak var profileGuruNameTextField: UITextField!
    
    @IBOutlet weak var profileNextNameLabel: UILabel!
    @IBOutlet weak var profileNextNameTextField: UITextField!
    
    @IBOutlet weak var profileEmailLabel: UILabel!
    @IBOutlet weak var profileEmailTextField: UITextField!
    
    @IBOutlet weak var passProfileLabel: UILabel!
    @IBOutlet weak var passProfileTextField: UITextField!
    @IBOutlet var textFieldGuruViews: [UIView]!
    
    @IBOutlet weak var closeGuruProfileButton: UIButton!
    @IBOutlet weak var saveGuruProfileButton: UIButton!
    
    private let combinationer: ProfileGuruCombinationer = ProfileGuruCombinationer()
    private let routeCenter: ProfileGuruRouteCenter = ProfileGuruRouteCenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        extendProfileGuruViewComponentWithData()
    }
    
    private func extendProfileGuruViewComponentWithData() {
        combinationer.initiateTextFieldGuruViews(textFieldGuruViews)
        combinationer.completeProfileGuruComponents(profileGuruView, profileGuruImageView, inMenuButton)
        combinationer.setTextDataFromProfileGuruCollector(appProfileGuruLabel, titleOfProfileLabel, personalInfoLabel, profileGuruNameLabel, profileNextNameLabel, profileEmailLabel, passProfileLabel, closeGuruProfileButton, saveGuruProfileButton)
        combinationer.loadProfileGuruSavedData(profileGuruNameTextField, profileNextNameTextField, profileEmailTextField, passProfileTextField, self)
        combinationer.preobserveProfileGuruSavedUserVisual(visualOfProfileImageView)
    }
    
    @IBAction func inMenuWithTap(_ sender: UIButton) {
        routeCenter.openInRouteToOptionMenuViewComponent(self)
    }
    
    @IBAction func selectVisualWithTap(_ sender: UIButton) {
        preinteractPhotoLibraryProfileAuthPermission()
    }
    
    @IBAction func closeGuruProfileWithTap(_ sender: UIButton) {
        routeCenter.openInRouteToOptionMenuViewComponent(self)
    }
    
    @IBAction func saveGuruProfileWithTap(_ sender: UIButton) {
        if profileGuruNameTextField.text!.isEmpty || profileNextNameTextField.text!.isEmpty || profileEmailTextField.text!.isEmpty || passProfileTextField.text!.isEmpty {
            combinationer.predisplaySaveAlertViewComponent(self, false)
        } else {
            combinationer.presaveProfileGuruUserVisual(visualOfProfileImageView, profileGuruNameTextField, profileNextNameTextField, profileEmailTextField, passProfileTextField)
            combinationer.predisplaySaveAlertViewComponent(self, true)
        }
    }
}

extension ProfileGuruViewComponent: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedGuruProfileVisual = info[.originalImage] as? UIImage {
            visualOfProfileImageView.image = selectedGuruProfileVisual
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ProfileGuruViewComponent: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

private extension ProfileGuruViewComponent {
    private func presentProfileGuruImagePickerViewComponent() {
        let profileGuruImagePickerViewComponent = UIImagePickerController()
        profileGuruImagePickerViewComponent.delegate = self
        profileGuruImagePickerViewComponent.sourceType = .photoLibrary
        present(profileGuruImagePickerViewComponent, animated: true, completion: nil)
    }
    
    private func preinteractPhotoLibraryProfileAuthPermission() {
        let permissionLibStatus = PHPhotoLibrary.authorizationStatus()
        if permissionLibStatus == .notDetermined {
            PHPhotoLibrary.requestAuthorization { [weak self] libStatus in
                if libStatus == .authorized {
                    DispatchQueue.main.async {
                        self?.presentProfileGuruImagePickerViewComponent()
                    }
                } else {
                    self?.combinationer.displayPhotoLibraryPermissionViewComponent(self!)
                }
            }
        } else if permissionLibStatus == .authorized {
            DispatchQueue.main.async {
                self.presentProfileGuruImagePickerViewComponent()
            }
        } else {
            self.combinationer.displayPhotoLibraryPermissionViewComponent(self)
        }
    }
}
