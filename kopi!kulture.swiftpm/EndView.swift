import SwiftUI

struct TextMessages: Identifiable {
    let id = UUID()
    let sender: String
    let message: String
}

struct EndView: View {
    @State var messages = [
        TextMessage(sender: "you", message: "i had a great time today!"),
    ]
    @State var isYourTurn = true
    @State var buttonText = "tap!"
    @State var isFinished = false
    @State var showButtons = false
    @State var yesClicked = false
    @State var noClicked = false
    var presetMessages = [
        "same!!",
        "glad we got a bite of singapore culture",
        "yeah! wanna go again tomorrow?",
    ]
    @State var currentMessageIndex = 0
    
    

    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Image(uiImage: UIImage(named: "memoji.jpeg")!)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text("bestie ❤️‍🔥")
                        .font(.headline)
                }
                .padding()
                .foregroundColor(Color.gray)
                .background(Color.white)
                
                Divider()
            }
            .background(Color.white)
            
            ScrollView {
                ForEach(0..<messages.count, id: \.self) { index in
                    let message = messages[index]
                    Text("\(message.message)")
                        .padding(10)
                        .background(message.sender == "you" ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        .frame(minWidth: 0, 
                               maxWidth: .infinity, 
                               alignment: message.sender == "you" ? .trailing : .leading)
                }
            }
            
            if showButtons == false {
                Button(action: {
                    if currentMessageIndex < presetMessages.count {
                        let newSender = isYourTurn ? "a friend" : "you"
                        let newMessage = presetMessages[currentMessageIndex]
                        messages.append(TextMessage(sender: newSender, message: newMessage))
                        isYourTurn.toggle()
                        currentMessageIndex += 1
                    } else {
                        showButtons = true
                    }
                }, label: {
                    Text(buttonText)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                })
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            }
            else {
                HStack {
                    Button(action: {
                        yesClicked = true
                    }) {
                        Text("Yes")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        noClicked = true
                    }) {
                        Text("No")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                
            }
            

        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        
        .fullScreenCover(isPresented: $yesClicked) {
            HawkerView()
        }
        .fullScreenCover(isPresented: $noClicked) {
            RealEndView()
        }
        
    }
    
}
