//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        switch args.last {
            case "fact":
                return args.count > 1 ? factorial(Int(args[0]) ?? 0) : 0
            case "avg":
                var sum = 0
                for i in 0...(args.count - 1) {
                    sum = sum + (Int(args[i]) ?? 0)
                }
                return sum / max(1, args.count - 1)
            case "count":
                return args.count - 1
            default: // Normal calculation
                let num1 : Int = Int(args[0])!
                let num2 : Int = Int(args[2])!
                switch args[1] {
                        case "%": return num1 % num2
                        case "+": return num1 + num2
                        case "-": return num1 - num2
                        case "*": return num1 * num2
                        case "/": return num1 / num2
                        default:
                            print("Your input is not well formatted. Please try again.")
                            return -1
                    }
                }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    // Returns -1 if the input is negative, otherwise (num!)
    public func factorial(_ num: Int) -> Int {
        if (num < 0) { return -1 }
        if (num == 0) { return 1 }
        return num * factorial(num - 1)
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

