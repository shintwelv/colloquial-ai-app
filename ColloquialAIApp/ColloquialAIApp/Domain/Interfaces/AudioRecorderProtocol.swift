import Foundation
import Combine

protocol AudioRecorderProtocol {
    var isRecording: Bool { get }
    var audioDataPublisher: AnyPublisher<Data, Never> { get }

    func startRecording() throws
    func stopRecording() -> Data?
}
