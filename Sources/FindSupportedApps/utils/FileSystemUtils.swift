import Foundation
public final class FileSystemUtils{
    static func verifyPathIsValidDirectory(path: String) throws {
        var isDir: ObjCBool = false;
        if FileManager.default.fileExists(atPath: path, isDirectory:&isDir) {
            if (!isDir.boolValue){
                throw DirectoryError.notADirectory(path: path)
            }
        } else {
            throw DirectoryError.pathUnavailable(path: path)
        }
    }

    static func findAppDirectoriesInDirectory(url: URL) throws -> [URL] {
        let directoryContents = try getDirectoryContents(url: url)
        
        let appDirs = directoryContents.filter {$0.isApp}
        return appDirs
    }

    private static func getDirectoryContents(url: URL) throws -> [URL]{
        return try FileManager.default.contentsOfDirectory(
            at: URL(fileURLWithPath: url.path),
            includingPropertiesForKeys: nil
        )
    }
}