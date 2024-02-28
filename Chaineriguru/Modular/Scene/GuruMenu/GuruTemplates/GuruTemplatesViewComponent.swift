//
//  GuruTemplatesViewComponent.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 20.02.2024.
//

import UIKit

class GuruTemplatesViewComponent: UIViewController {
    
    @IBOutlet weak var guruTemplatesImageView: UIImageView!
    @IBOutlet weak var guruTemplatesTitleLabel: UILabel!
    @IBOutlet weak var backToMenuButton: UIButton!
    @IBOutlet weak var templatesTitleLabel: UILabel!
    @IBOutlet weak var guruTemplatesTableView: UITableView!
    @IBOutlet weak var closeGuruTemplatesButton: UIButton!
    @IBOutlet weak var saveGuruTemplatesButton: UIButton!
    
    private let routeCenter: GuruTemplatesRouteCenter = GuruTemplatesRouteCenter()
    private let combinationer: GuruTemplatesCombinationer = GuruTemplatesCombinationer()

    override func viewDidLoad() {
        super.viewDidLoad()
        extendGuruTemplatesViewComponentWithData()
    }
    
    private func extendGuruTemplatesViewComponentWithData() {
        combinationer.completeGuruTemplatesComponents(guruTemplatesImageView, backToMenuButton, guruTemplatesTableView, self)
        combinationer.setTextDataFromGuruTemplatesCollector(guruTemplatesTitleLabel, templatesTitleLabel, closeGuruTemplatesButton, saveGuruTemplatesButton)
    }
    
    @IBAction func backToMenuWithTap(_ sender: UIButton) {
        routeCenter.openBackToRouteToOptionMenuViewComponent(self)
    }
    
    @IBAction func closeGuruTemplatesWithTap(_ sender: UIButton) {
        routeCenter.openBackToRouteToOptionMenuViewComponent(self)
    }
    
    @IBAction func saveGuruTemplatesWithTap(_ sender: UIButton) {
        combinationer.configureGuruTemplatesSave(self)
    }
}

extension GuruTemplatesViewComponent: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        savedGuruTemplatesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let guruTemplateCell = tableView.dequeueReusableCell(withIdentifier: "templateGuruComponentCell", for: indexPath) as! TemplateGuruComponentCell
        guruTemplateCell.backgroundColor = .clear
        
        let inputGuruTemplatesData = savedGuruTemplatesData[indexPath.row]
        guruTemplateCell.extendTemplateGuruComponentCellWithSavedData(inputGuruTemplatesData)
        guruTemplateCell.preloadTemplateProgressViews()
        
        guruTemplateCell.selectionStyle = .none
        return guruTemplateCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        390
    }
}
