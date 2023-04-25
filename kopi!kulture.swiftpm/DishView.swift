import SwiftUI

struct DishView: View {
    let dish: Dish
    var body: some View {
        List {
            // Large title
            Text(dish.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 30)
            
            // Image and description
            HStack(alignment: .top, spacing: 20) {
                dish.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(dish.description)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .padding()
            .padding(.horizontal, 20)
            
            // Smaller title
            Text("Origin culture")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 30)
            
            // Centered text
            Text("This dish comes from \(dish.originCulture)")
            
            // Spice progress bar
            HStack {
                Text("Spice")
                
                ProgressBar(value: CGFloat(dish.spiceValue)) 
                
                Image(systemName: "flame.fill")
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            // Hotness icon
            HStack {
                Text("Hot or cold?")
                Image(systemName: dish.isHot ? "flame.fill" : "snow")
                    .foregroundColor(dish.isHot ? .red : .blue)
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            // Smaller title
            Text("Pronunciation")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 30)
            
            // Text below smaller title
            Text(dish.pronunciation)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)
            
            Spacer()
        } 
    }
}

struct ProgressBar: View {
    var value: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundColor(Color.gray.opacity(0.2))
                
                Capsule()
                    .frame(width: geometry.size.width * value)
                    .foregroundColor(Color.blue)
            }
        }
        .frame(height: 10)
    }
}
