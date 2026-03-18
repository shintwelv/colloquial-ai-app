import AVFoundation

protocol AudioPermissionManagerProtocol {
    func checkPermission() async -> Bool
}

final class AudioPermissionManager: AudioPermissionManagerProtocol {
    func checkPermission() async -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: .audio)

        switch status {
        case .authorized:
            return true
        case .notDetermined:
            return await AVAudioApplication.requestRecordPermission()
        case .denied, .restricted:
            return false
        @unknown default:
            return false
        }
    }
}
