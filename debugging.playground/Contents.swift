//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String!
    var wordB : String!
    
    init (words: [String?]) {
        wordA = words[0]!
        wordB = words[1]!
    }
    
//: This isn't the correct way to unwrap optionals because you should use ! instead of ?. In the above lines the String value was already forced with 'String!' so you know the variables definitely hold String values.
    

    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    class func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map() {String($0.characters.reverse())}
        var numElements = words.count
        
        var i = 0;
        for i; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: The compiler dislikes this for loop because "let i" means that 'i' is a constant and not mutable as a loop index variable. You could declare "var i = 0;" in the line above the loop. The result that the loop should return is 'true' instead of 'nil' past the 'for' loop because all the words would be palindromes. The result of the function calls at the bottom are 'true' for 'palindromes' and 'false' for 'notPalindromes'.
    
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    class func isAnagram(wordA: String, wordB: String) -> Bool? {
        var countLetters = [Character : Int]()
        var lenA = wordA.characters.count
        var lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: One of the problems with the function declaration is that it was not preceded by "class", so Swift was trying to call it with the object itself as an argument. Adding "class" fixes this behavior. Another problem with this method is that the 'countLetters' dictionary was not initialized correctly and should have been 'var countLetters = [Character : Int]() as shown above. This initializes the empty dictionary correctly for the function to use later on. Also, you can change the 'return nil' at the end to 'return true' since wordA and wordB would definitely be anagrams at that point.


//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

