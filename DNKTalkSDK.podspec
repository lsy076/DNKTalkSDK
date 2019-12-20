Pod::Spec.new do |s|
s.name         = "DNKTalkSDK"
s.version      = "1.0.5"
s.summary      = "DNKTalkSDK."
s.description  = <<-DESC
DNKTalkSDK对讲库
DESC
s.homepage     = "https://github.com/lsy076/DNKTalkSDK"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "赖盛源" => "756486059@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/lsy076/DNKTalkSDK.git", :tag => s.version }
s.vendored_frameworks = "DNKTalkSDK/DNKTalkSDK/DNKTalkSDK.framework"
s.requires_arc = true
end