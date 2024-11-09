//
//  main.swift
//  swiftwordfind
//
//  Created by Phillip Brown on 09/11/2024.
//
// TODO
// ~Add full alphabet DONE
// ~Loop to get how many random letters and add to another array DONE
// ~Performance Metrics
import Foundation
import Cocoa

let filePath = "/Users/phillipb/Documents/swiftwordfind/swiftwordfind/words_alpha.txt" //words to read
let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l","m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var letters = [String]() //letters to check against
var words = [String]() //empy array for words containing all the letters above to be pushed to.
var time = [Double]()

//function to get letters from the alphabet array
func getLetters(){
    for _ in 0..<6{     //forloop form 0 to 6
        let randomIndex = Int.random(in: 0..<alphabet.count) //get a random index from the array
        letters.append(alphabet[randomIndex])   //add to the letters array
    }
    
    //print the selected letters
    print("Selected Letters")
    for letter in letters{
        print(letter, terminator: ",")
    }
    print()
}
//This function does the actual finding
func findWords(){
    do {
        let content = try String(contentsOfFile: filePath, encoding: .utf8) //read in the text file
        let lines = content.components(separatedBy: .newlines)
            .filter { !$0.isEmpty } //removes empty lines
        
        for line in lines { //for each line in the text file
            var isValidWord = true //set bool
            
            for char in line{ //for each character in the word
                if !letters.contains(String(char)){ //if the letter is not present in the letters array
                    isValidWord = false
                    break   //break and start on next line
                }
                //implied, if it does match, continue until no more letters or not
            }
            if isValidWord{ //if the word is valid, add to list
                words.append(line)
            }
        }
    }
    catch {
        print("Error no file found: \(error)")
    }
}
//Prints the results from the array.
func outputResults(){
    // if the word array something in it, print them
    if words.count > 0 {
        for line in words{
            print(line)
        }
    }
    //else print that nothing was found.
    else {
        print("no words found")
    }
}

getLetters()
findWords()
outputResults()

