import Foundation
public final class SupportedAppsFinder{
    static func findAppsSupporting(_ fileType: String, in directory: String) throws -> [String]{
        try FileSystemUtils.verifyPathIsValidDirectory(path: directory)
        let appDirectories = try FileSystemUtils.findAppDirectoriesInDirectory(url: URL(fileURLWithPath: directory))
            
        let appSupports = try appDirectories.compactMap { try appSupportedFileTypes(appPath: $0) }
        
        let appsThatSupportsFileType = appSupports.filter {$0.supportedFileTypes.contains(fileType)}
        return appsThatSupportsFileType.map {$0.appName}
    }

    private static func appSupportedFileTypes(appPath: URL) throws -> AppSupport?{
        let plistPath = try getValidPlistPathForApp(at: appPath)
        let infoDictionary = try getInfoDictionaryFromPlist(at: plistPath)

        return AppSupport(appName: PlistUtils.getAppName(from: infoDictionary), supportedFileTypes: PlistUtils.getSupportedFileTypes(from: infoDictionary))
    }

    private static func getValidPlistPathForApp(at path: URL) throws -> URL{
        // Check if plist exists at expected path
        let plistPath = path.appendingPathComponent("Contents").appendingPathComponent("Info.plist")
        if (!plistPath.checkFileExist()){
            throw FileError.fileDoesNotExist(path: plistPath.path)
        }
        return plistPath
    }

    private static func getInfoDictionaryFromPlist(at path:URL) throws -> NSDictionary {
        var infoDictionary: NSDictionary?
        infoDictionary = NSDictionary(contentsOfFile: path.path)
        if(infoDictionary == nil){
            throw PListError.cannotParseAsDictionary(path: path.path)
        }
        return infoDictionary!
    }
}