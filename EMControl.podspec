Pod::Spec.new do |s|

  s.name         = "EMControl"
  s.version      = "1.0.0"
  s.summary      = "Easy Match image search api SDK"
  s.description  = "With Easy Match image search SDK you can easily make image search queries via Bunsar Image Search api."
  s.homepage     = "https://github.com/GokhanOrun/EMControl"
  s.screenshots  = "http://aplikalab.com/wp-content/uploads/bunsar.png", "http://www.bunsar.com/images//alternate1.jpg"
  s.license      = "MIT"
  s.author             = { "Bunsar" => "Easy Match" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/GokhanOrun/EMControl.git", :tag => "1.0.0" }
  
  s.source_files = "EMControl", "EMControl/**/*.{h,m}"
  s.public_header_files = "EMControl/**/*.h"
  
end
