Pod::Spec.new do |s|
s.name         = "DNKTalkSDK"
s.version      = "1.0.0"
s.summary      = "一个建立pod仓库的DNKTalkSDK."
s.description  = <<-DESC
这只是一个建立pod仓库的简单demo，并没有实际的意思。教学使用。
DESC
s.homepage     = "https://github.com/lsy076/DNKTalkSDK"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "赖盛源" => "756486059@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/lsy076/DNKTalkSDK.git", :tag => s.version }
s.source_files  = "Classes", "DNKTalkSDK/DNKTalkSDK/DNKTalkSDK.framework/**/*.{h}"
s.vendored_frameworks = "DNKTalkSDK.framework"
s.requires_arc = true
end