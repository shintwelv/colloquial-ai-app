import Foundation

protocol AIConversationProvider {
    // Transcribes the given audio data and returns the transcribed text.
    func transcribe(audioData: Data) async throws -> String

    // Analyzes the user's text and returns a response containing the colloquial version, phrasal verb suggestions, and an AI-generated reply.
    func analyzeAndReply(userText: String) async throws -> AIAnalysisResponse
}
