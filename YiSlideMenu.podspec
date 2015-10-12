Pod::Spec.new do |s|
  s.name         = "YiSlideMenu"
  s.version      = "0.1"
  s.summary      = "YiSlideMenu"
  s.homepage     = "https://github.com/coderyi/YiSlideMenu"
  s.license      = "MIT"
  s.authors      = { "coderyi" => "coderyi@163.com" }
  s.source       = { :git => "https://github.com/coderyi/YiSlideMenu.git", :tag => "0.1" }
  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'
  s.platform     = :ios, '7.0'
  s.source_files = 'YiSlideMenu/YiSlideMenu/**/**/*.{h,m}'
  s.requires_arc = true
end