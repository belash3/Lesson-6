//
//  main.swift
//  Lesson 6
//
//  Created by Сергей Беляков on 21.03.2021.
//

import Foundation

protocol People {
    var name: String { get }
    var year: Double { get }
}

class Woman: People {
    var name: String
    var year: Double


    init(year: Double, name: String) {
        self.year = year
        self.name = name
    }
}

class Man: People {
    var name: String
    var year: Double
    
    init(year: Double, name: String) {
        self.year = year
        self.name = name
    }
}

struct GenericQueue<T> {
    private var queue: [T] = []
    
    mutating func filterQueue(predicate: (T) -> Bool) {
        var tempArray: [T] = []
        for human in queue {
            if predicate(human) {
                tempArray.append(human)
            }
        }
        for human in queue {
            if !predicate(human) {
                tempArray.append(human)
            }
        }
        queue = tempArray
    }
    
    mutating func push(_ element: T) {
        queue.append(element)
    }
    
    mutating func pop() -> T? {
        guard queue.count > 0 else { return nil }
        return queue.removeFirst()
    }
}

extension GenericQueue {
    subscript(index: Int) -> T? {
        guard index >= 0 && index < queue.count else {
            return nil
        }
        return queue[index]
    }
}

var shopQueue = GenericQueue<People> () // Создадим очередь людей в магазине
shopQueue.push(Man(year: 55, name: "Mike"))
shopQueue.push(Woman(year: 35, name: "Sarah"))
shopQueue.push(Woman(year: 70, name: "Jessica"))
shopQueue.push(Man(year: 66, name: "Robin"))
shopQueue.push(Woman(year: 20, name: "Kate"))

let isBenef: (People) -> Bool = { (human: People) -> Bool in // Добавим проверку на льготы для пенсионеров
    return human.year >= 65
}

shopQueue.filterQueue(predicate: isBenef) // Отсортируем людей в соответствии с наличием у них льгот - пенсионеров пропустим в начало очереди, остальных в конец

shopQueue[4]
shopQueue[5]

shopQueue.pop()
shopQueue.pop()
shopQueue.pop()
shopQueue.pop()
shopQueue.pop()
shopQueue.pop()


