import SwiftUI
struct HawkerView: View {
    
    @State var stall: Int?
    @State var isFinished: Bool = false
    @State var stallClicked: Bool = false
    @State var stallOneClicked: Bool = false
    @State var stallTwoClicked: Bool = false
    @State var skipButtonClicked: Bool = false
    @State private var isPopoverVisible = false
    
    let kayaToast = Dish(title: "Kaya Toast",
                         image: Image("kayatoast"),
                         description: "A traditional breakfast made with slices of toasted bread, kaya (coconut spread) and a slice of butter. Eaten alongside soft-boiled eggs with soy sauce, and coffee.", 
                         originCulture: "Hainanese immigrants to Singapore.", 
                         spiceValue: 0.02, 
                         isHot: true,
                         pronunciation: "kɑːɪə təʊst")
    let nasiLemak = Dish(title: "Nasi Lemak", 
                     image: Image("nasilemak"), 
                     description: "Fragrant rice cooked in coconut milk and pandan leaves, served with fried anchovies, peanuts, cucumber, sambal (chili paste), and an egg.", 
                     originCulture: "Nyonya or Peranakan culture.", 
                     spiceValue: 0.85, 
                     isHot: true, 
                     pronunciation: "nɑːsi lɛmɑːk")
    let rotiPrata = Dish(title: "Roti Prata", 
                         image: Image("rotiprata"), 
                         description: "A fluffy, layered flatbread made of flour, water, and ghee (clarified butter), served with curries as dipping sauces.", 
                         originCulture: "Indian cuisine.", 
                         spiceValue: 0.7, 
                         isHot: true, 
                         pronunciation: "roʊti prɑːtɑː")
    let chickenRice = Dish(title: "Chicken Rice", 
                         image: Image("chickenrice"), 
                         description: "Fluffy cooked rice flavored with chicken stock and served with boiled or roasted chicken, cucumber, chili sauce and soy sauce.", 
                         originCulture: "Hainanese cuisine from southern China.", 
                         spiceValue: 0.25, 
                         isHot: true, 
                         pronunciation: "tʃɪkən raɪs")
    
    let laksa = Dish(title: "Laksa", 
                     image: Image("laksa"), 
                     description: "Singaporean curry laksa is a coconut milk based soup with thick rice noodles, garnished with tofu, shrimp, beansprouts and egg.", 
                     originCulture: "Peranakan culture - a mix of Chinese and Malay influences.", 
                     spiceValue: 0.85, 
                     isHot: true, 
                     pronunciation: "lˈɑːksɑː")
    let wantonMee = Dish(title: "Wanton Mee", 
                           image: Image("wantonmee"), 
                           description: "Egg noodles served with wontons filled with minced pork, shrimp, and spices, in a light soy sauce broth. Also eaten with char siu (barbequed pork).", 
                           originCulture: "Cantonese cuisine.", 
                           spiceValue: 0.25, 
                           isHot: true, 
                           pronunciation: "wɑːntɒn miː")
    let charKwayTeow = Dish(title: "Char Kway Teow", 
                         image: Image("charkwayteow"), 
                         description: "Flat rice noodles stir-fried with soy sauce, chili paste, shrimp, cockles, bean sprouts, and Chinese sausage.", 
                         originCulture: "Hokkien cuisine.", 
                         spiceValue: 0.5, 
                         isHot: true, 
                         pronunciation: "tʃɑːr kweɪ tiːaʊ")
    let maggiGoreng = Dish(title: "Maggi Goreng", 
                            image: Image("maggigoreng"), 
                            description: "Maggi instant noodles, stir-fried with vegetables such as cabbage, carrots, and bean sprouts, and often with chicken or shrimp. Flavored with a blend of spices and sauces, such as soy sauce, chili sauce, and tomato ketchup.", 
                            originCulture: "Indonesian and Malaysian cuisine.", 
                            spiceValue: 0.5, 
                            isHot: true, 
                            pronunciation: "ˈmæɡi ɡɔrɛŋ")
    
    let kopi = Dish(title: "Kopi", 
                        image: Image("kopi"), 
                    description: "Coffee made from Robusta beans that are roasted with sugar and margarine under high heat to caramelise the beans. The ground coffee is then mixed with hot water and strained in a flannel sock filter, after which it is mixed in a variety of ways.", 
                        originCulture: "Malaysian and Singaporean coffee shop culture.", 
                        spiceValue: 0.01, 
                        isHot: true, 
                        pronunciation: "koʊpi")
    let miloDino = Dish(title: "Milo Dinosaur", 
                            image: Image("milodino"), 
                            description: "A drink made with Milo powder (a chocolate malt drink), mixed with condensed milk, sugar, and ice, topped with extra Milo powder.", 
                            originCulture: "Singapore-based Indian-Muslim food stalls.", 
                            spiceValue: 0.01, 
                            isHot: false, 
                            pronunciation: "maɪloʊ daɪnəsɔ")
    let bandung = Dish(title: "Bandung", 
                        image: Image("bandung"), 
                        description: "A sweet and creamy drink made of condensed milk, rose syrup, and water, with a pink color.", 
                        originCulture: "Indian-Muslim culture.", 
                        spiceValue: 0.01, 
                        isHot: false, 
                        pronunciation: "bɑːndʊŋ")
    let iceKacang = Dish(title: "Ice Kacang", 
                           image: Image("icekacang"), 
                           description: "A dessert made with shaved ice, topped with various sweet ingredients such as red beans, grass jelly, corn, and syrup, perfect for a hot summer day.", 
                           originCulture: "Malaysia and Singapore.", 
                           spiceValue: 0.01, 
                           isHot: false, 
                           pronunciation: "aɪs kɑːtʃɑːŋ")
    let ondehOndeh = Dish(title: "Ondeh-ondeh", 
                         image: Image("ondeh"), 
                         description: "Small glutinous rice balls filled with palm sugar, and rolled in grated coconut.", 
                         originCulture: "Malaysia and Singapore.", 
                         spiceValue: 0.01, 
                         isHot: true,
                         pronunciation: "ɔːndəh ɔːndəh")
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Button {
                    stall = 0
                    stallClicked = true
                } label: {
                    Image("stall")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .shadow(color: .yellow, radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal, 170)
                .padding(.top, 50)
                HStack {
                    Button {
                        stall = 1
                        stallOneClicked = true
                    } label: {
                        ZStack {
                            Image("stall1")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .shadow(color: .yellow, radius: 5, x: 0, y: 5)
                            
                        }
                    }
                    Spacer()
                    Image(systemName: "person.fill")
                        .foregroundColor(Color.black)
                        .font(.system(size: 50))
                    Spacer()
                    Button {
                        stall = 2
                        stallTwoClicked = true
                        
                    } label: {
                        Image("stall1")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .shadow(color: .yellow, radius: 5, x: 0, y: 5)
                    }
                }
                .padding(.horizontal, 50)
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 300, height: 300)
                        
                        ForEach(0..<4, id: \.self) { index in
                            HStack {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 50, height: 50)
                                Color.clear.frame(width: 320, height: 5)
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 50, height: 50)
                            }
                            .rotationEffect(.init(degrees: Double(-35 * index)))
                        }
                        Image("tissue")
                            .resizable()
                            .shadow(color: .yellow, radius: 5, x: 0, y: 5)
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .offset(x: 50, y: -50)
                            .onTapGesture {
                                isPopoverVisible = true
                            }
                            .popover(isPresented: $isPopoverVisible) {
                                Text("Chope!")
                                    .font(.title)
                                    .foregroundColor(.yellow)
                                    .padding()
                                Text("Choping culture is a common practice in Singapore where people reserve, or 'chope' tables or seats. \nThis is done by placing personal items at the seat, like tissue paper or umbrellas!\nThis is used as a way to identify reserved seats to avoid waiting around with a tray of food.\nBe aware of stray tissue packets when you visit!")
                                    .frame(width: 350)
                                    .padding()
                                
                            }
                        }
                    .offset(x: -150, y: 150)
                    Color.clear
                    Color.clear
                    VStack {
                        Image("board")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        Button {
                            skipButtonClicked = true
                        } label: {
                            Text("skip the game")
                                .padding()
                                .font(.headline)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                    .onTapGesture {
                        isFinished = true
                    }
                    Color.clear
                }
            }
        }
        

        
        .sheet(isPresented: $stallClicked) {
            NavigationView {
                List {
                    NavigationLink(destination: DishView(dish: kayaToast)) {
                        VStack {
                            Image("kayatoast")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: chickenRice)) {
                        VStack {
                            Image("chickenrice")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: nasiLemak)) {
                        VStack {
                            Image("nasilemak")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: rotiPrata)) {
                        VStack {
                            Image("rotiprata")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    
                    // more dishes
                }
                .navigationTitle("Local Delights")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            stallClicked = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $stallOneClicked) {
            NavigationView {
                List {
                    NavigationLink(destination: DishView(dish: laksa)) {
                        VStack {
                            Image("laksa")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: wantonMee)) {
                        VStack {
                            Image("wantonmee")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: charKwayTeow)) {
                        VStack {
                            Image("charkwayteow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: maggiGoreng)) {
                        VStack {
                            Image("maggigoreng")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    // add more dishes here
                }
                .navigationTitle("Noodles")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            stallOneClicked = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $stallTwoClicked) {
            NavigationView {
                List {
                    NavigationLink(destination: DishView(dish: kopi)) {
                        VStack {
                            Image("kopi")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: miloDino)) {
                        VStack {
                            Image("milodino")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: bandung)) {
                        VStack {
                            Image("bandung")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: iceKacang)) {
                        VStack {
                            Image("icekacang")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    NavigationLink(destination: DishView(dish: ondehOndeh)) {
                        VStack {
                            Image("ondeh")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    // add more dishes here
                }
                .navigationTitle("Drinks & Dessert")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            stallTwoClicked = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $isFinished) { 
            MemoryView()
        }
        .fullScreenCover(isPresented: $skipButtonClicked) {
            EndView()
        }
    }
}

extension Int: Identifiable {
    public var id: Int { self }
}
