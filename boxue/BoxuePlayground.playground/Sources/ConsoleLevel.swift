import Foundation

public extension Bool {
  /// 非单元测试的成功、失败，只是为了能使输出更可读
  /// - attention:warning 警告需处理
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

public class ConsoleLevel {
  
  public class var verbose : String {
    return "💜";
  }

  public class var debug : String {
    return "💚";
  }

  public class var info : String {
    return "💙";
  }

  public class var warning : String {
    return "💛";
  }

  public class var error : String {
    return "❤️";
  }
}
