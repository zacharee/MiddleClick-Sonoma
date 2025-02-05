struct MiddleClickConfig {
  /// The number of fingers needed to simulate a middle click.
  static let fingersNumKey = "fingers"
  static let fingersNumDefault = 3

  /// Can be more than defined fingersNum.
  static let allowMoreFingersKey = "allowMoreFingers"
  static let allowMoreFingersDefault = false

  /// The maximum distance the cursor can travel between touch and release for a tap to be considered valid.
  /// The position is normalized and values go from 0 to 1.
  static let maxDistanceDeltaKey = "maxDistanceDelta"
  static let maxDistanceDeltaDefault: Float = 0.05

  /// The maximum interval in milliseconds between touch and release for a tap to be considered valid.
  static let maxTimeDeltaMsKey = "maxTimeDelta"
  static let maxTimeDeltaMsDefault = 300

  static let needClickKey = "needClick"
  static let needClickDefault = false
}

let kCGMouseButtonCenter: Int64 = 2
