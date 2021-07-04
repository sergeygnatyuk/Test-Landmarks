import Foundation

protocol ILandmarksRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> ILandmarksRouter
}
