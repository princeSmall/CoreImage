# CoreImage

### 1-1 效果类型的过滤器类别常量
效果类型|指示
--------|---------
kCICategoryDistortionEffect|失真效果，如凹凸，旋转，洞
kCICategoryGeometryAdjustment|几何调整，如仿射变换，裁剪，透视变换
kCICategoryCompositeOperation|合成，例如source over，minimum，source atop，color dodge blend mode
kCICategoryHalftoneEffect|半色调效果，如屏幕，线条屏幕，阴影线
kCICategoryColorAdjustment|颜色调整，如伽马调整，白点调整，曝光
kCICategoryColorEffect|色彩效果，如色调调整，张贴
kCICategoryTransition|图像之间的过渡，例如溶解，与面具分解，滑动
kCICategoryTileEffect|平铺效果，如平行四边形，三角形
kCICategoryGenerator|图像生成器，如条纹，恒定颜色，棋盘格
kCICategoryGradient|梯度，如轴向，径向，高斯
kCICategoryStylize|风格化，例如像素化，结晶
kCICategorySharpen|锐化，亮度
kCICategoryBlur|模糊，如高斯，变焦，运动

### 1-2 属性值数据类型
数据类型|目的|描述
--------|---|----------
字符串|NSString|文本，通常用于显示给用户
浮点值|NSNumber|标量值，例如强度级别或半径
矢量|CIVector|一组浮点值，可指定位置，大小，矩形或未标记的颜色分量值
颜色|CIColor|一组颜色组件值，标记有指定如何解释它们的颜色空间
图片|CIImage|一个图像; 请参阅图像是过滤器的输入和输出
变换|NSData， NSAffineTransform|要应用于图像的坐标转换

### 1-3 使用

1. 实例化CIFilter表示要应用的过滤器的对象，并为其参数提供值
2. 创建一个CIContext对象（使用默认选项）过创建自己的上下文，您可以更精确地控制渲染过程和渲染所涉及的资源
3. 输出filter.outputImage
