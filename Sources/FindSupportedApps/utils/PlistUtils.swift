import Foundation
public final class PlistUtils{

    static func getAppName(from infoDictionary: NSDictionary) -> String{
        return infoDictionary["CFBundleDisplayName"] as? String ?? infoDictionary["CFBundleName"] as! String
    }
    
    static func getSupportedFileTypes(from infoDictionary: NSDictionary) -> [String]{
        var supportedFileTypes: [String] = []

        // Not all apps hold those keys. We're interested only in the ones that do
        if let documentTypes: [NSDictionary] = infoDictionary["CFBundleDocumentTypes"] as? [NSDictionary]{ 
            // Extract support file types
            for docType in documentTypes{
                if let fileType = docType["LSItemContentTypes"] as? NSArray as? [String]{
                    supportedFileTypes.append(contentsOf: fileType)
                }
            }
        }
        return supportedFileTypes
    }
}