import Foundation

struct VenuesResponse: Codable {
    let venues: [Venue]
}

struct Venue: Codable {
    let id: Int
    let category: String
    let name: String
}
