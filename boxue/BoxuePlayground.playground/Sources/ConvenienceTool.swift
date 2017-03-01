import Foundation

public extension Bool {
  /// 非单元测试的成功、失败，只是为了能**使输出更可读**的可预期的结果
  /// - attention:warning 一般不使用警告，一旦使用，需适时处理
  public func executeTestResult(funcName functionName: String) {
    let spaceNumber = (25 - functionName.characters.count)
    var formatFunctionName = functionName
    if spaceNumber > 0 {
      formatFunctionName = functionName.appending(String(Array(repeating: " ", count: spaceNumber)))
    } else {
      print("\(ConsoleLevel.warning) function name is too long")
    }
    print("\(formatFunctionName) function execute \(self ? "\(ConsoleLevel.info)success" : "\(ConsoleLevel.error)failure")")
  }
}
