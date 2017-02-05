[TOC]

# Cosmos Swift 3 适配记

## API 变更

* ```swift
  // 当前
  NotificationCenter.default
  OperationQueue.current
  Bundle.main
  // 变更前
  NSNotificationCenter.defaultCenter() 
  NSOperationQueue.currentQueue()
  NSBundle.mainBundle()
  ```

* ```swift
  // 当前
  Bundle.main.url(forResource: name, withExtension:nil)
  AVAudioPlayer(contentsOf: url)
  player.averagePower(forChannel: channel)
  // 变更前
  NSBundle.mainBundle().URLForResource(name, withExtension:nil)
  AVAudioPlayer(contentsOfURL: url)
  player.averagePowerForChannel(channel)
  ```

* ```swift
  // 当前
  TimeInterval(val)
  // 变更前
  NSTimeInterval(val)
  ```

* ```swift
  // 当前
  let observer = nc.addObserver(forName: NSNotification.Name(rawValue: AnimationCompletedEvent), object: self, queue: OperationQueue.current, using: { notification in
    action()
  })
  // 变更前
  let observer = nc.addObserverForName(AnimationCancelledEvent, object: self, queue: NSOperationQueue.currentQueue(), usingBlock: { notification in
              action()
          })
  // 补充
  func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> Void) -> NSObjectProtocol
  ```

* ```swift
  // 当前
  type(of: subview)
  // 变更前
  subview.dynamicType
  ```


* ```swift
  // 当前
  open func addCompletionObserver(_ action: @escaping () -> Void) -> AnyObject
  // 变更前
  public func addCompletionObserver(action: () -> Void) -> AnyObject
  // 补充:忽略参数标签 _
  ```


* ```swift
  // 当前
  DispatchQueue.main.async {
              NotificationCenter.default.post(name: Notification.Name(rawValue: AnimationCompletedEvent), object: self)
          }
  // 变更前
  dispatch_async(dispatch_get_main_queue()) {      NSNotificationCenter.defaultCenter().postNotificationName(AnimationCompletedEvent, object: self)
          }
  ```


* ```swift
  // 当前
    let arc = CGMutablePath()
  arc.addArc(center: CGPoint(center), radius: CGFloat(radius), startAngle: CGFloat(start), endAngle: CGFloat(end), clockwise: !clockwise)
  // 变更前
  let arc = CGPathCreateMutable()
  CGPathAddArc(arc, nil, CGFloat(center.x), CGFloat(center.y), CGFloat(radius), CGFloat(start), CGFloat(end), !clockwise)
  // 补充：相似的有 move、addArc、addCurve 等
  ```


* ```swift
  // 当前
  open var playing: Bool {
          get {
              return player.isPlaying
          }
      }
  // 变更前
  public var playing: Bool {
          get {
              return player.playing
          }
      }
  // 补充：返回布尔值命名
  player.isMeteringEnabled
  ```




## `fileprivate`和`open`

* `fileprivate`/`private`
  * `fileprivate`：文件内私有（在同一个文件内其它类可以访问，相当于 Swift 3 之前的 `private` 访问权限）
  * `private`：只在这个类或者结构体的作用域内可以访问
* `open`/`public`
  * `open`：
  * `public`：



## 参考资料

* [Swift 3必看：新的访问控制fileprivate和open - 简书](http://www.jianshu.com/p/604305a61e57)
* [ObjC 中国 - Swifter - 100 个 Swift 必备 Tips](https://objccn.io/products/swifter-tips/)
* [The Swift Programming Language中文版](http://wiki.jikexueyuan.com/project/swift/)