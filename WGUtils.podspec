Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "WGUtils"
s.summary = "WGUtils includes the most used Swift Utility functions that are helping the Wintergardeners life from day to day"
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Bence Pattogató" => "pattogatobence@gmail.com" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/pattogato/WGUtils"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/pattogato/WGUtils.git", :tag => "#{s.version}"}


# 7
s.framework = "UIKit"

# 8
s.source_files = "WGUtils/**/*.{swift}"

# 9
s.resources = "WGUtils/**/*.{png,jpeg,jpg}"
end