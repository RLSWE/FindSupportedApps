import Foundation

extension URL {
    var isApp: Bool { try! resourceValues(forKeys: [.typeIdentifierKey]).typeIdentifier == "com.apple.application-bundle" }
    func checkFileExist() -> Bool {
        let path = self.path
        if (FileManager.default.fileExists(atPath: path))   {
            return true
        }else        {
            return false;
        }
    }
}