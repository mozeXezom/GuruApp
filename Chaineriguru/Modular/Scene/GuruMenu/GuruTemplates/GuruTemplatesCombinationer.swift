//
//  GuruTemplatesCombinationer.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 20.02.2024.
//

import Foundation
import UIKit

class GuruTemplatesCombinationer {
    private let collector: GuruTemplatesCollector = GuruTemplatesCollector()
    
    func completeGuruTemplatesComponents(_ guruTemplate: UIImageView, _ backToMenu: UIButton, _ guruTableView: UITableView, _ viewComponent: GuruTemplatesViewComponent) {
        guruTemplate.image = collector.templatesGuruVisual
        backToMenu.setImage(collector.templatesMenuGuruVisual, for: .normal)
        guruTableView.backgroundColor = .clear
        guruTableView.delegate = viewComponent
        guruTableView.dataSource = viewComponent
        guruTableView.separatorStyle = .none
        guruTableView.register(UINib(nibName: "TemplateGuruComponentCell", bundle: nil), forCellReuseIdentifier: "templateGuruComponentCell")
    }
    
    func configureGuruTemplatesSave(_ viewComponent: GuruTemplatesViewComponent) {
        viewComponent.interactViewComponentAlertWithInputData(collector.guruTemplatesTitleAlertCaption, componentAlertMessage: collector.guruTemplatesMessageAlertCaption)
    }
    
    func setTextDataFromGuruTemplatesCollector(_ templateTitle: UILabel, _ allTemplatesTitle: UILabel, _ closeTemplates: UIButton, _ saveTemplates: UIButton) {
        templateTitle.text = collector.guruTemplatesCaption
        allTemplatesTitle.text = collector.titleTemplatesCaption
        closeTemplates.setTitle(collector.closeGuruTemplatesCaption, for: .normal)
        saveTemplates.setTitle(collector.saveGuruTemplatesCaption, for: .normal)
        closeTemplates.layer.cornerRadius = 10
        saveTemplates.layer.cornerRadius = 10
    }
}
