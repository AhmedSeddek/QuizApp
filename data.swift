//
//  data.swift
//  TrueFalseStarter
//
//  Created by ahmed seddek on 7/28/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
class Questions {

    let question: String
    let option1: String
    let option2: String
    let option3: String
    let option4: String
    let answer: String
    
    init(question: String, option1: String, option2: String, option3: String, option4: String, answer: String)
    {
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.answer = answer
    }
}

let question1 = Questions(
    question: "This was the only US President to serve more than two consecutive terms.",
    option1: "George Washington",
    option2: "Franklin D. Roosevelt",
    option3: "Woodrow Wilson",
    option4: "Andrew Jackson",
    answer: "Franklin D. Roosevelt")

let question2 = Questions(
    question: "Which of the following countries has the most residents?",
    option1: "Nigeria",
    option2: "Russia",
    option3: "Iran",
    option4: "Vietnam",
    answer: "Nigeria")

let question3 = Questions(
    question: "In what year was the United Nations founded?",
    option1: "1918",
    option2: "1919",
    option3: "1945",
    option4: "1954",
    answer: "1945")

let question4 = Questions(
    question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
    option1: "Paris",
    option2: "Washington D.C.",
    option3: "New York City",
    option4: "Boston",
    answer: "New York City")

let question5 = Questions(
    question: "Which nation produces the most oil?",
    option1: "Iran",
    option2: "Iraq",
    option3: "Brazil",
    option4: "Canada",
    answer: "Canada")

let question6 = Questions(
    question: "Which country has most recently won consecutive World Cups in Soccer?",
    option1: "Italy",
    option2: "Brazil",
    option3: "Argetina",
    option4: "Spain",
    answer: "Brazil")

let question7 = Questions(
    question: "Which of the following rivers is longest?",
    option1: "Yangtze",
    option2: "Mississippi",
    option3: "Congo",
    option4: "Mekong",
    answer: "Mississippi")

let question8 = Questions(
    question: "Which city is the oldest?",
    option1: "Mexico City",
    option2: "Cape Town",
    option3: "San Juan",
    option4: "Sydney",
    answer: "Mexico City")

let question9 = Questions(
    question: "Which country was the first to allow women to vote in national elections?",
    option1: "Poland",
    option2: "United States",
    option3: "Sweden",
    option4: "Senegal",
    answer: "Poland")

let question10 = Questions(
    question: "Which of these countries won the most medals in the 2012 Summer Games?",
    option1: "France",
    option2: "Germany",
    option3: "Japan",
    option4: "Great Britian",
    answer: "Great Britian")

let allQuestions = [question1,question2,question3,question4,question5,question6,question7,question8,question9,question10]




