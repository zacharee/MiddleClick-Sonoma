import Cocoa

UserDefaults.standard.register(defaults: [
  MiddleClickConfig.fingersNumKey: MiddleClickConfig.fingersNumDefault,
  MiddleClickConfig.allowMoreFingersKey: MiddleClickConfig.allowMoreFingersDefault,
  MiddleClickConfig.maxDistanceDeltaKey: MiddleClickConfig.maxDistanceDeltaDefault,
  MiddleClickConfig.maxTimeDeltaMsKey: MiddleClickConfig.maxTimeDeltaMsDefault,
])

let app = NSApplication.shared

let con = Controller()
con.start()

let menu = TrayMenu(controller: con)
app.delegate = menu

app.run()
