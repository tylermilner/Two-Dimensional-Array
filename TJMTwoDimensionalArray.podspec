Pod::Spec.new do |s|
  s.name         = "TJMTwoDimensionalArray"
  s.version      = "1.0.0"
  s.summary      = "A simple 2D Array written in Objective-C."
  s.description  = "A sumple 2D NSArray implementation written in Objective-C."
  s.homepage     = "https://github.com/Cubd/Two-Dimensional-Array"
  s.license      = { :type => "MIT", :file => "license.txt" }
  s.author             = { "Tyler Milner" => "tyler@tylermilner.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/Cubd/Two-Dimensional-Array.git", :tag => "1.0.0" }
  s.source_files  = "Source"
  s.exclude_files = "Test Project"
  s.requires_arc = true
end
