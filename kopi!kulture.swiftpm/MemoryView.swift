import SwiftUI

struct MemoryView: View {
    
    // Array of images and their descriptions
    let images = ["bandung", "charkwayteow", "chickenrice", "icekacang", "kayatoast", "kopi", "laksa", "maggigoreng", "milodino", "nasilemak", "ondeh", "rotiprata", "wantonmee"]
    let descriptions = ["bandung", "char kway teow", "chicken rice", "ice kacang", "kaya toast", "kopi", "laksa", "maggi goreng", "milo dinosaur", "nasi lemak", "ondeh-ondeh", "roti prata", "wanton mee"]
    
    // Point counter
    @State private var points = 0
    @State private var previousPoints = 0
    
    // Randomly selected image and description
    @State private var selectedImage = ""
    @State private var selectedDescription = ""
    
    // Timer
    @State private var secondsRemaining = 20
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var currentPage: Page = .game
    
    @State var isFinished: Bool = false
    
    enum Page {
        case game, end
    }
    
    var body: some View {
        switch currentPage {
        case .game: game
        case .end: end
        }
    }
    
    var end: some View {
        VStack {
            Spacer()
            Text("You won \(points) points!")
            Spacer()
            Button {
                isFinished = true
            } label: {
                Text("Next")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding()
                    
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $isFinished) { 
            EndView()
        }
    }
    
    var game: some View {
        VStack {
            Spacer()
            Text(points > previousPoints ? "Correct" : "Wrong")
                .padding()
                .foregroundColor(.white)
                .background(points > previousPoints ? Color.green : Color.red)
                .cornerRadius(10)
            
            // Point counter
            HStack {
                Spacer()
                Text("Points: \(points)")
                    .padding(.trailing, 20)
            }
            
            // Randomly selected image and description
            Image(selectedImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
            
            Text(selectedDescription)
                .font(.headline)
                .padding(.top, 10)
            
            // Buttons
            HStack {
                Button("Match") {
                    checkMatch(true)
                }
                .padding(.vertical, 10)
                .frame(width: 100)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Not Match") {
                    checkMatch(false)
                }
                .padding(.vertical, 10)
                .frame(width: 100)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .onAppear(perform: startGame)
        .onReceive(timer) { _ in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                endGame()
            }
        }
    }
    
    // Start the game by selecting the first image and description
    func startGame() {
        selectRandomImageAndDescription()
    }
    
    // End the game by showing the final score
    func endGame() {
        timer.upstream.connect().cancel()
        // Show final score in an alert
        currentPage = .end
    }
    
    // Select a random image and description
    func selectRandomImageAndDescription() {
        let randomNumber = Int.random(in: 0...1)
        if randomNumber == 0 {
            selectedImage = images.randomElement() ?? ""
            selectedDescription = descriptions.randomElement() ?? ""
            
        } else {
            let randomIndex = Int.random(in: 0..<images.count)
            selectedImage = images[randomIndex]
            selectedDescription = descriptions[randomIndex]
            
        }
    }
    
    
    // Check if the player's selection matches the image and update the points counter
    func checkMatch(_ isMatch: Bool) {
        let isCorrect = (selectedImage == "bandung" && selectedDescription == "bandung") || (selectedImage == "charkwayteow" && selectedDescription == "char kway teow") || (selectedImage == "chickenrice" && selectedDescription == "chicken rice") || (selectedImage == "icekacang" && selectedDescription == "ice kacang") || (selectedImage == "kayatoast" && selectedDescription == "kaya toast") || (selectedImage == "kopi" && selectedDescription == "kopi") || (selectedImage == "laksa" && selectedDescription == "laksa") || (selectedImage == "maggigoreng" && selectedDescription == "maggi goreng") || (selectedImage == "milodino" && selectedDescription == "milo dinosaur") || (selectedImage == "nasilemak" && selectedDescription == "nasi lemak") || (selectedImage == "ondeh" && selectedDescription == "ondeh-ondeh") || (selectedImage == "rotiprata" && selectedDescription == "roti prata") || (selectedImage == "wantonmee" && selectedDescription == "wanton mee")
        
        if isCorrect == isMatch {
            previousPoints = points
            points += 1
        } else {
            previousPoints = points
        }
        
        selectRandomImageAndDescription()
    }
}

