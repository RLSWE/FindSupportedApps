import Foundation
import ArgumentParser

struct FindSupportedApps: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "FindSupportedApps checks a directory to see which apps in it can run a file of a certain type (Apple types)",
        version: "0.0.1"
    )
    
    @Option(name: .shortAndLong, help: "The directory to look for the apps")
    var directory: String
    
    @Option(name: .customShort("t"), help: "The file type to check if the apps in the directory argument can run. The format is a dot separated LSItemContentType (e.g. public.txt) which is found in an application’s Info.plist")
    var fileType: String
    
    mutating func run() throws {
        fileType = fileType.replacingOccurrences(of: "\"", with: "")

        let supportingAppsNames = try SupportedAppsFinder.findAppsSupporting(fileType, in: directory)
        supportingAppsNames.forEach() {print($0)}
    }
}


FindSupportedApps.main()