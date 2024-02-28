//
//  ProfileGuruCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 20.02.2024.
//

import Foundation
import UIKit

class ProfileGuruCombinationer {
    private let collector: ProfileGuruCollector = ProfileGuruCollector()
    private let profileGuruDefaults = UserDefaults.standard
    
    func completeProfileGuruComponents(_ profileView: UIView, _ profileImageView: UIImageView, _ profileMenu: UIButton) {
        profileView.layer.cornerRadius = 10
        profileImageView.image = collector.guruProfileVisual
        profileMenu.setImage(collector.profileGuruMenuVisual, for: .normal)
    }
    
    func loadProfileGuruSavedData(_ profileName: UITextField, _ profileLastName: UITextField, _ profileEmail: UITextField, _ profilePass: UITextField, _ viewComponent: ProfileGuruViewComponent) {
        profileName.text = profileGuruDefaults.string(forKey: "regUserName")
        profileLastName.text = profileGuruDefaults.string(forKey: "regSecUserName")
        profileEmail.text = profileGuruDefaults.string(forKey: "regUserEmail")
        profilePass.text = profileGuruDefaults.string(forKey: "regUserPass")
        profilePass.isSecureTextEntry = true
        profileName.delegate = viewComponent
        profileLastName.delegate = viewComponent
        profileEmail.delegate = viewComponent
        profilePass.delegate = viewComponent
    }
    
    func preobserveProfileGuruSavedUserVisual(_ profileUserVisual: UIImageView) {
        if let savedVisualData = profileGuruDefaults.data(forKey: "profileGuruVisual") {
            let visualUser = UIImage(data: savedVisualData)
            profileUserVisual.layer.cornerRadius = profileUserVisual.frame.height / 2
            profileUserVisual.image = visualUser
        } else {
            profileUserVisual.layer.cornerRadius = profileUserVisual.frame.height / 2
            profileUserVisual.image = collector.noProfileVisual
        }
    }
    
    func presaveProfileGuruUserVisual(_ profileVisual: UIImageView, _ nameToSave: UITextField, _ nextNameToSave: UITextField, _ emailToSave: UITextField, _ passToSave: UITextField) {
        if let userVisualToSave = profileVisual.image,
           let imageData = userVisualToSave.jpegData(compressionQuality: 1.0) {
            profileGuruDefaults.set(imageData, forKey: "profileGuruVisual")
            profileGuruDefaults.set(nameToSave.text, forKey: "regUserName")
            profileGuruDefaults.set(nextNameToSave.text, forKey: "regSecUserName")
            profileGuruDefaults.set(emailToSave.text, forKey: "regUserEmail")
            profileGuruDefaults.set(passToSave.text, forKey: "regUserPass")
        }
    }
    
    func displayPhotoLibraryPermissionViewComponent(_ viewComponent: ProfileGuruViewComponent) {
        let permissionViewComponent = UIAlertController(title: collector.permissionViewComponentTitleCaption,
                                                        message: collector.permissionViewComponentMessageCaption,
                                                        preferredStyle: .alert)
        permissionViewComponent.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        permissionViewComponent.addAction(UIAlertAction(title: "Настройки", style: .default, handler: { _ in
            if let settingsUrlComponent = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsUrlComponent, options: [:], completionHandler: nil)
            }
        }))
        viewComponent.present(permissionViewComponent, animated: true, completion: nil)
    }
    
    func setTextDataFromProfileGuruCollector(_ profileTitle: UILabel, _ customProfile: UILabel, _ personalInfo: UILabel, _ nameProfile: UILabel, _ nextName: UILabel, _ emailProfile: UILabel, _ passProfile: UILabel, _ closeProfile: UIButton, _ saveProfile: UIButton) {
        profileTitle.text = collector.profileGuruTitleCaption
        customProfile.text = collector.customProfileCaption
        personalInfo.text = collector.personalInfoCaption
        nameProfile.text = collector.profileNameCaption
        nextName.text = collector.profileLastNameCaption
        emailProfile.text = collector.profileEmailCaption
        passProfile.text = collector.profilePassCaption
        closeProfile.setTitle(collector.closeProfileCaption, for: .normal)
        saveProfile.setTitle(collector.saveProfileCaption, for: .normal)
        closeProfile.layer.cornerRadius = 10
        saveProfile.layer.cornerRadius = 10
    }
    
    func predisplaySaveAlertViewComponent(_ viewComponent: ProfileGuruViewComponent, _ saveState: Bool) {
        if saveState {
            viewComponent.interactViewComponentAlertWithInputData(collector.correctComponentSaveTitleCaption, componentAlertMessage: collector.correctComponentSaveMessageCaption)
        } else {
            viewComponent.interactViewComponentAlertWithInputData(collector.saveAlertComponentTitleCaption, componentAlertMessage: collector.saveAlertComponentMessageCaption)
        }
    }
    
    func initiateTextFieldGuruViews(_ profileGuruViews: [UIView]) {
        for profileGuruView in profileGuruViews {
            profileGuruView.layer.cornerRadius = 10
            profileGuruView.layer.borderWidth = 1
            profileGuruView.layer.borderColor = collector.profileGuruPlaceColor.cgColor
        }
    }
}
