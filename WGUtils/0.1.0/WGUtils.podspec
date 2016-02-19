Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "WGUtils"
s.summary = "WGUtils includes the most used Swift Utility functions that are helping the Wintergardeners life from day to day"
s.requires_arc = true

s.version = "0.1.0"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Bence Pattogató" => "pattogatobence@gmail.com" }


s.homepage = "https://github.com/pattogato/WGUtils"

s.source = { :git => "https://github.com/pattogato/WGUtils.git", :tag => "#{s.version}"}

s.framework = "UIKit"

s.source_files = "WGUtils/**/*.{swift}"

s.resources = "WGUtils/**/*.{png,jpeg,jpg}"
end