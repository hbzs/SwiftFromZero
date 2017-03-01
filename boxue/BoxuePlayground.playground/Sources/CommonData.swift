import Foundation

/// 斐波那契数列
public let fibnacci = [0, 1, 1, 2, 3, 5, 8]

/// 方位
public enum Direction {
  case north, south, east(abbr: String), west(abbr: String)
}
