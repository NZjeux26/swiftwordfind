//
//  main.swift
//  swiftwordfind
//
//  Created by Phillip Brown on 09/11/2024.
//

import Foundation

if let path = Bundle.main.path(forResource: "word_alpha", ofType: "txt") { // conbines an if with the file path
    do {
        let content = try String(contentsOfFile: path, encoding: .utf8)
        let lines = content.components(separatedBy: .newlines)
        
        for line in lines {
            print(line)
        }
    } catch {
        print("Error no file found: \(error)")
    }
}
