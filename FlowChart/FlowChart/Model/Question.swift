//
//  Question.swift
//  FlowChart
//
//  Created by Michael Durkin on 12/17/21.
//

import Foundation
class Question {
    let questionImage: String
    let question: String
    let subject: String

    let optionA: String
    let optionB: String
    
    init(image: String, questionText: String, subjectText: String, choiceA: String, choiceB: String){
        questionImage = image
        question = questionText
        subject = subjectText
        optionA = choiceA
        optionB = choiceB
    }
}
