import Foundation

print("Pattys Password Generator 9000")

print("How many characters would you like your password to be?")

if let response = readLine(), let length = Int(response) {
    // Use the 'response' variable to access the user's input
    print("You entered: \(length), Do you want to continue?")
    
    if confirmAction(message: "Do you want to proceed?") {
        print("Continuing.")
        
        loadingBar(100)
        
        // Automatically generate and print the password after the loading bar is done
        let randomPassword = generateRandomPassword(length: length)
        print("Generated Password: \(randomPassword)")
        
        // Calculate the expected number of guesses to crack the password
        let expectedGuesses = calculateExpectedGuesses(passwordLength: length)
        print("Expected number of guesses to crack password: \(expectedGuesses)")
        
        // Estimate the time to crack the password
        let hashesPerSecond = 126_367 // Average modern computer hashing rate
        let estimatedTimeInSeconds = expectedGuesses / Double(hashesPerSecond)
        print("Estimated time to crack password: \(estimatedTimeInSeconds) seconds")
    } else {
        print("Quitting.")
    }
} else {
    print("Invalid input. Please enter a valid number.")
}

func confirmAction(message: String) -> Bool {
    print(message + " (y/n)")
    
    while let response = readLine(strippingNewline: true) {
        switch response.lowercased() {
        case "y", "yes":
            return true
        case "n", "no":
            return false
        default:
            print("Enter 'y' for Yes or 'n' for No.")
        }
    }
    
    // Default to false if no valid response is provided
    return false
}

func loadingBar(_ total: Int) {
    let progressBarWidth = 50
    let progressStep = total / progressBarWidth
    
    print("Loading: [", terminator: "")
    
    for _ in 1...progressBarWidth {
        usleep(100000)
        print("=", terminator: "")
        fflush(stdout)
        
        for _ in 1...progressStep {
           
        }
    }
    
    print("] Done!")
}

func generateRandomPassword(length: Int) -> String {
    let allowedCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]};:'\",<.>/?"
    var password = ""
    
    for _ in 0..<length {
        let randomIndex = Int.random(in: 0..<allowedCharacters.count)
        let character = allowedCharacters[allowedCharacters.index(allowedCharacters.startIndex, offsetBy: randomIndex)]
        password.append(character)
    }
    
    return password
}

func calculateExpectedGuesses(passwordLength: Int) -> Double {
    let c = pow(2.0 * Double(passwordLength), Double(passwordLength))
    return c / 2.0
}
print("Your Welcome :)")
