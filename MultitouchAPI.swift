// Multitouch API Bridging
//typealias MTDeviceRef = UnsafeMutableRawPointer
typealias MTContactCallbackFunction = (Int32, UnsafeMutablePointer<Finger>?, Int32, Double, Int32) -> Int32

struct mtPoint {
    var x: Float
    var y: Float
}

struct mtReadout {
    var pos: mtPoint
    var vel: mtPoint
}

struct Finger {
    var frame: Int32
    var timestamp: Double
    var identifier: Int32
    var state: Int32
    var foo3: Int32
    var foo4: Int32
    var normalized: mtReadout
    var size: Float
    var zero1: Int32
    var angle: Float
    var majorAxis: Float
    var minorAxis: Float
    var mm: mtReadout
    var zero2: (Int32, Int32)
    var unk2: Float
}

@_silgen_name("MTDeviceCreateDefault")
func MTDeviceCreateDefault() -> MTDevice

@_silgen_name("MTDeviceCreateList")
func MTDeviceCreateList() -> [MTDevice]

@_silgen_name("MTDeviceRelease")
func MTDeviceRelease(_ device: MTDevice)

@_silgen_name("MTRegisterContactFrameCallback")
func MTRegisterContactFrameCallback(_ device: MTDevice, _ callback: MTContactCallbackFunction)

@_silgen_name("MTUnregisterContactFrameCallback")
func MTUnregisterContactFrameCallback(_ device: MTDevice, _ callback: MTContactCallbackFunction)

@_silgen_name("MTDeviceStart")
func MTDeviceStart(_ device: MTDevice, _ something: Int32)

@_silgen_name("MTDeviceStop")
func MTDeviceStop(_ device: MTDevice)
