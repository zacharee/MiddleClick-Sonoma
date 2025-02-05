import Foundation

/// TODO: rewrite to simple struct after fully migrating to Swift
@objcMembers class MiddleClickConfig: NSObject {
  static let fingersNumKey = "fingers"
  static let fingersNumDefault: Int8 = 3

  static let allowMoreFingersKey = "allowMoreFingers"
  static let allowMoreFingersDefault = false

  static let maxDistanceDeltaKey = "maxDistanceDelta"
  static let maxDistanceDeltaDefault: Float = 0.05

  static let maxTimeDeltaMsKey = "maxTimeDelta"
  static let maxTimeDeltaMsDefault: Int32 = 300

  static let needClickKey = "needClick"
  static let needClickDefault = false
}

let kCGMouseButtonCenter: Int64 = 2
