
Pod::Spec.new do |spec|

  spec.name         = "VCDriftTask"
  spec.version      = "1.0.0"
  spec.summary      = "一个ios平台的队列库，异步进入，同步输出"

  spec.description  = '一个ios平台的队列库，异步进入，同步输出'

  spec.homepage     = "https://github.com/ivoidcat/VCDriftTask.git"

  spec.license      = "Copyright (c) 2019年 voidcat. All rights reserved."


  spec.author             = { "voidcat" => "voidcat@163.com" }


  spec.source       = { :git => "https://github.com/ivoidcat/VCDriftTask.git", :tag => "1.0.0" }


  spec.public_header_files = "VCDriftTask/*.{h,m}"
  spec.source_files  = "VCDriftTask/*.{h,m}"



end
