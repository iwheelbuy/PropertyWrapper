Pod::Spec.new do |s|

    s.name                  = 'PropertyWrapper'
    s.version               = '0.0.1'
    s.ios.deployment_target = '11.0'
    s.license               = 'MIT'
    s.homepage              = 'https://github.com/iwheelbuy/PropertyWrapper'
    s.author                = { 'iwheelbuy' => 'iwheelbuy@protonmail.com' }
    s.source                = { :git => 'git@github.com:iwheelbuy/PropertyWrapper.git', :tag => s.version.to_s }
    s.summary               = 'Collection of useful Swift PropertyWrappers'
    s.cocoapods_version     = '>= 1.8.4'
    s.source_files          = '**/*.swift'
    s.swift_versions        = ['5.1']

end
