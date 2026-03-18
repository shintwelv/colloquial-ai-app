import Foundation

struct AIAnalysisResponse: Decodable {
    let colloquialVersion: String
    let phrasalVerbSuggestions: [PhrasalVerbDTO]
    let aiReply: String
}
