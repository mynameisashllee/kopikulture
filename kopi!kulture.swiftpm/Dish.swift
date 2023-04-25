import SwiftUI

struct Dish: Identifiable {
    let id = UUID()
    let title: String
    let image: Image
    let description: String
    let originCulture: String
    let spiceValue: Float
    let isHot: Bool
    let pronunciation: String
}
