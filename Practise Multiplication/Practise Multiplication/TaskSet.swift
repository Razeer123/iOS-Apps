//
//  TaskSet.swift
//  Practise Multiplication
//
//  Created by Michał Derej on 22/01/2021.
//

import Foundation

struct TaskSet {
    
    var tasks = [Task]()
    
    init(limit: Int, numberOfQuestions: Int) {
        tasks = generateTasks(range: limit, numberOfQuestions: numberOfQuestions)
    }
    
    func generateTasks(range: Int, numberOfQuestions: Int) -> [Task] {
        
        var temp = [Task]()
        
        for i in 1...range {
            for j in 1...12 {
                if j >= i {
                    let result = String(i * j)
                    temp.append(Task(task: "\(i) x \(j) =", answer: result))
                    if (i != j) {
                        temp.append(Task(task: "\(j) x \(i)", answer: result))
                    }
                }
            }
        }
        
        temp.shuffle()
        return Array(temp[0..<numberOfQuestions])
        
    }
}
