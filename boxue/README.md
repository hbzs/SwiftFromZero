# Swift 学习

## 字符串

### 「C 风格」字符串演变

* 由若干个字符组成的长度固定的字符数组，每个字符对应着一个 8 位的 ASCII 数值
  * 只能显示 ASCII 码表中的 128 个字符
* 基于 8-bit ASCII 编码（`ISO/IEC 8859`）
  * 启用了字符编码中的第 8 个 bit，使用了 160-255 范围的数值
  * 定义了 16 个大类（按不同国家和地区语言符号的特征），作为不同部分，分别定义成 `ISO/IEC 8859-n`
* 固定长度的 Unicode 编码
  * USC-2：16-bit 等宽字符的编码方案
  * 32-bit 不经济
* 可变长度的 Unicode 编码
  * 编码单位（code unit）长度可变
    * 多种长度单位的数值构成：UTF-8、UTF-16、UTF-32
  * 构成同一字符的「编码单位」组合也是可变的
* `Surrogate pair` (不会被定义的字符编码) ／ `unicode scalar`
* `grapheme cluster`

### String

* 原有编程方案缺陷：显示字符可能由多个 code unit 组合而成
* 设计目标：尽可能保持这个类型在 Unicode 上的语义正确
* Swift 中，是可多维度展现一个 Unicode 视图的类型
* 不能简单的看作集合，复杂的组合规则，会产生歧义
* `==` 判断字符串：`canonically equivalent`
* String 为能安全做集合处理，提供了不同的属性（「view」）
  * unicodeScalar、utf8、utf16、characters
  * `index(_:offsetBy:limitedBy:)`

### 注释

* 自定义类型的注释中说明

  * 一句话描述；
  * 类型主要功能；Overview
  * 常用的初始化方法以及拷贝语义；Initializers、Value semantics
  * 补充说明；note
* 方法的描述
  * 一句话功能描述；
  * 常见应用场景；
  * 参数；
  * 返回值；
  * 时间复杂度；