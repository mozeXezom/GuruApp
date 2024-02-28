//
//  GuruTemplatesModel.swift
//  Chaineriguru
//
//  Created by Yurii Derzhylo on 20.02.2024.
//

import UIKit

struct GuruTemplatesModel {
    let titleOfGuruTemplate: String
    let totalBudgetGuru: String
    let firstGuruGoal: String
    let secondGuruGoal: String
    let thirdGuruGoal: String
    let firstBudget: String
    let secondBudget: String
    let thirdBudget: String
    let guruTemplateVisualPic: UIImage
    let progressGuruColor: UIColor
}

var savedGuruTemplatesData: [GuruTemplatesModel] = [
    GuruTemplatesModel(titleOfGuruTemplate: "Кофейня", totalBudgetGuru: "29 000 $", firstGuruGoal: "Оборудование", secondGuruGoal: "Сотрудники", thirdGuruGoal: "Продукты", firstBudget: "9 000 $", secondBudget: "7 000 $", thirdBudget: "13 000 $", guruTemplateVisualPic: UIImage(named: "cofeTemplateGuru")!, progressGuruColor: #colorLiteral(red: 0.007167100441, green: 0.3864219785, blue: 0.8456237316, alpha: 1)),
    GuruTemplatesModel(titleOfGuruTemplate: "Салон красоты", totalBudgetGuru: "75 000 $", firstGuruGoal: "Техника", secondGuruGoal: "Косметика", thirdGuruGoal: "Персонал", firstBudget: "25 000 $", secondBudget: "36 000 $", thirdBudget: "14 000 $", guruTemplateVisualPic: UIImage(named: "beautyTemplateGuru")!, progressGuruColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),
    GuruTemplatesModel(titleOfGuruTemplate: "Технологическая компания", totalBudgetGuru: "115 000 $", firstGuruGoal: "Разработчики", secondGuruGoal: "Оборудование", thirdGuruGoal: "Сервера", firstBudget: "60 000 $", secondBudget: "30 000 $", thirdBudget: "25 000 $", guruTemplateVisualPic: UIImage(named: "ItTemplateGuru")!, progressGuruColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
    GuruTemplatesModel(titleOfGuruTemplate: "Школа программирования", totalBudgetGuru: "50 000 $", firstGuruGoal: "Мебель", secondGuruGoal: "Учителя", thirdGuruGoal: "Компьютеры", firstBudget: "6 500 $", secondBudget: "10 000 $", thirdBudget: "23 500 $", guruTemplateVisualPic: UIImage(named: "schoolTemplateGuru")!, progressGuruColor: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))
]
