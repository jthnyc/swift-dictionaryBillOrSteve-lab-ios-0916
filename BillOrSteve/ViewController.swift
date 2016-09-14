//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var correctCount: UILabel!
    @IBOutlet weak var labelSteve: UILabel!
    @IBOutlet weak var labelBill: UILabel!
    
    var randomFacts: [String: [String]] = [:] // use xcode to autofill
    var correctPerson: String = ""
    var correctAnswers = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    
    @IBAction func steveButton(sender: AnyObject) {
        if correctPerson == "Steve Jobs" && correctAnswers < 9 {
            correctAnswers += 1
            correctCount.text = String(correctAnswers)
            showFact()
        } else {
            showFact()
        }
        
        

    }
    
    @IBAction func billButton(sender: AnyObject) {
        if correctPerson == "Bill Gates" && correctAnswers < 9 {
            correctAnswers += 1
            correctCount.text = String(correctAnswers)
            showFact()
        } else {
            showFact()
        }
        
    }
    
    
    
    func createFacts() {
        randomFacts["Steve Jobs"] =
            ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
             "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
             "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
             "He was a pescetarian, meaning he ate no meat except for fish."]
        
        
        randomFacts["Bill Gates"] =
            ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
             "He scored 1590 (out of 1600) on his SATs.",
             "His foundation spends more on global health each year than the United Nation's World Health Organization.",
             "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
             "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
    }
    
    
    func getRandomFact() -> (name: String, fact: String) {
        let personName = randomPerson() // get the name
        var result: String = ""
        let factsCount = randomFacts[personName]!.count
        
        if personName == "Steve Jobs" {
            
            let index = randomNumberFromZeroTo(factsCount)
            let factsSteve = randomFacts["Steve Jobs"]
            result = factsSteve![index]
    
        } else {
            let index = randomNumberFromZeroTo(factsCount)
            let factsBill = randomFacts["Bill Gates"]
            result = factsBill![index]
            }
            
            return (personName, result)
        }
    

    
    
    func showFact() {
        
        let nameAndFact = getRandomFact()
        let name = nameAndFact.name
        let fact = nameAndFact.fact
        
        factLabel.text = fact
        correctPerson = name
        
        
    }
    
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        
        return Int(arc4random_uniform(UInt32(number)))
        
    }
    
    func randomPerson() -> String {
        
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
        
    }
    
}

