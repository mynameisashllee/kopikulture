import SwiftUI

struct TextMessage: Identifiable {
    let id = UUID()
    let sender: String
    let message: String
}

struct ContentView: View {
    @State var messages = [
        TextMessage(sender: "notyou", message: "yoo what are you doing"),
    ]
    @State var isYourTurn = false
    @State var buttonText = "tap!"
    @State var isFinished = false
    var presetMessages = [
        "not much im at the hawker centre \nnear my house",
        "im really hungry ah im on my way",
        "ok! can't wait to grab lunch with you",
        "same! i missed that lately",
        "i missed YOU lah",
        "i missed the roti prata there also",
        "HAHA see u soon!!",
        "💗💗",
    ]
    @State var currentMessageIndex = 0
    
    var popupTexts: [Int: String] = [
        1: "A hawker centre is an open air complex in Singapore and other Southeast Asian countries, typically with dozens or even hundreds of food stalls serving a variety of dishes. Hawker centres are known for cheap, good and tasty local food."
    ]
    
    @State var popupSelection: Int?
    
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
                    popupView(index)
                }
            }
            
            Button(action: {
                if currentMessageIndex < presetMessages.count {
                    let newSender = isYourTurn ? "a friend" : "you"
                    let newMessage = presetMessages[currentMessageIndex]
                    messages.append(TextMessage(sender: newSender, message: newMessage))
                    isYourTurn.toggle()
                    currentMessageIndex += 1
                } else {
                    isFinished = true
                    buttonText = "let's go!"
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
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        
        
        .fullScreenCover(isPresented: $isFinished) {
            HawkerView()
        }
    }
    
    @ViewBuilder
    func popupView(_ index: Int) -> some View {
        if let bottomThing = popupTexts[index] {
            HStack {
                Spacer()
                Button {
                    popupSelection = index
                } label: {
                    Image(systemName: "info.circle")
                }
                .popover(isPresented: .init(get: { popupSelection == index }, set: { isShown in
                    if isShown {
                        popupSelection = index
                    } else {
                        popupSelection = nil
                    }
                })) {
                    Text(bottomThing)
                        .frame(width: 300)
                        .padding()
                }
            }
            .padding(.trailing, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
