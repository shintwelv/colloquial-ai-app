import Foundation

struct MockAIService: AIConversationProvider {
    func transcribe(audioData: Data) async throws -> String {
        return "I want to extinguish the fire"
    }

    func analyzeAndReply(userText: String) async throws -> AIAnalysisResponse {
        return AIAnalysisResponse(
            colloquialVersion: "I want to put out the fire",
            phrasalVerbSuggestions: [
                .init(academics: "extinguish", phrasalVerb: "put out", reason: "More colloquial way to say 'extinguish'")
            ],
            aiReply: "Sure, I can help you with that."
        )
    }
}
