#
# Be sure to run `pod lib lint DevtorExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DevtorExtension'
  s.version          = '0.1.0'
  s.summary          = 'Devtor extension is very easy to use for developer who is lazy for long code'
  s.swift_version    = '4.0'
  
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO:
* Foundation extension
* UIKit extension
* Other extension will included next release
                       DESC

  s.homepage         = 'https://github.com/imfeemily/DevtorExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ifeemily@gmail.com' => 'ifeemily@gmail.com' }
  s.source           = { :git => 'https://github.com/imfeemily/DevtorExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'DevtorExtension/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DevtorExtension' => ['DevtorExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
end
