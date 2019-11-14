Pod::Spec.new do |s|

    s.name                  = 'PropertyWrapper-CopyOnWrite'
    s.version               = '1'
    s.ios.deployment_target = '11.0'
    s.homepage              = 'https://aizel.ru/'
    s.author                = 'Mikhail Vasilev'
    s.source                = { :git => 'git@github.com:iwheelbuy/AizelCommon.git', :tag => s.version.to_s }
    s.summary               = 'AizelCommon'
    s.cocoapods_version     = '= 1.8.4'
    s.source_files          = 'CopyOnWrite.swift'
    s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '5.1' }

end
