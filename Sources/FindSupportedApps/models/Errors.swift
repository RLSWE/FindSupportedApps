import Foundation

public enum DirectoryError: LocalizedError{
    case notADirectory(path: String)
    case pathUnavailable(path: String)
    
    public var errorDescription: String? {
        switch self {
        case .notADirectory(let path):
            return "Path [\(path)] is not a directory"
            
        case .pathUnavailable(let path):
            return "[\(path)] is not a valid path"
        }
    }
}

public enum FileError: LocalizedError{
    case fileDoesNotExist(path: String)
    
    public var errorDescription: String? {
        switch self {
        case .fileDoesNotExist(let path):
            return "No file exists at [\(path)]"
        }
    }
}

public enum PListError: LocalizedError{
    case cannotParseAsDictionary(path: String)
    
    public var errorDescription: String? {
        switch self {
        case .cannotParseAsDictionary(let path):
            return "Cannot parse file at [\(path)] as dictionary"
        }
    }
}

