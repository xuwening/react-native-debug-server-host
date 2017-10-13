#
#  Be sure to run `pod spec lint react-native-diff-update.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "DebugServerHost"
  s.version      = "0.3.5"
  s.summary      = "change server host dynamically."

  s.description  = <<-DESC
      change server host dynamically.
                   DESC

  s.homepage     = "https://github.com/xuwening/react-native-debug-server-host.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "hongjingjun" => "xuwening@126.com" }

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"
  s.ios.deployment_target = '8.0'

  #s.library        = 'z', 'bz2'
  s.dependency 'React'
  #s.dependency 'SSZipArchive'


  s.source_files = 'DebugServerHost/Classes/*.{h,m}'
  #s.public_header_files = ['DebugServerHost/Classes/*.h']

  
  s.source       = { :git => "https://github.com/xuwening/react-native-debug-server-host.git", :tag => "#{s.version}" }

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


end
