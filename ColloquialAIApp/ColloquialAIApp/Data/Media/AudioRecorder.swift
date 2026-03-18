import AVFoundation
import Combine

final class AudioRecorder: NSObject, AudioRecorderProtocol {
    private var audioRecorder: AVAudioRecorder?
    @Published private(set) var recordedData: Data?
    var audioDataPublisher: AnyPublisher<Data, Never> { $recordedData }

    var isRecording: Bool {
        audioRecorder?.isRecording ?? false
    }

    func startRecording() throws {
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        let url = FileManager.default.temporaryDirectory.appendingPathComponent("recording.m4a")
        audioRecorder = try AVAudioRecorder(url: url, settings: settings)
        audioRecorder?.record()
    }

    func stopRecording() -> Data? {
        audioRecorder?.stop()
        guard let url = audioRecorder?.url else { return nil }
        let data = try? Data(contentsOf: url)
        self.recordedData = data
        return data
    }
}

