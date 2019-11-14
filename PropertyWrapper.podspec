Pod::Spec.new do |s|

    s.name                  = 'PropertyWrapper'
    s.version               = '0.0.1'
    s.ios.deployment_target = '11.0'
    s.homepage              = 'https://github.com/iwheelbuy/PropertyWrapper'
    s.author                = 'Mikhail Vasilev'
    s.source                = { :git => 'git@github.com:iwheelbuy/PropertyWrapper.git', :tag => s.version.to_s }
    s.summary               = 'Swift PropertyWrapper collection'
    s.cocoapods_version     = '>= 1.8.4'
    s.source_files          = '**/*.swift'
    s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '5.1' }

end
