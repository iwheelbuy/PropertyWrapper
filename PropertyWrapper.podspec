# git fetch --prune origin "+refs/tags/*:refs/tags/*"
# git tag 0.0.4
# git push origin 0.0.4
# pod lib lint PropertyWrapper.podspec --no-clean --verbose --allow-warnings
# pod spec lint PropertyWrapper.podspec --allow-warnings
# pod trunk push PropertyWrapper.podspec --verbose --allow-warnings

Pod::Spec.new do |s|

    s.name                  = 'PropertyWrapper'
    s.version               = '0.0.4'
    s.ios.deployment_target = '13.0'
    s.license               = 'MIT'
    s.homepage              = 'https://github.com/iwheelbuy/PropertyWrapper'
    s.author                = { 'iwheelbuy' => 'iwheelbuy@protonmail.com' }
    s.source                = { :git => 'https://github.com/iwheelbuy/PropertyWrapper.git', :tag => s.version.to_s }
    s.summary               = 'Collection of useful Swift PropertyWrappers'
    s.cocoapods_version     = '>= 1.9.3'
    s.source_files          = 'Source/**/*.swift'
    s.swift_versions        = ['5.1']
    s.default_subspec       = 'Base'

    s.subspec 'Base' do |ss|
        ss.source_files = 'Source/**/*.swift'
    end

    s.subspec 'Pretty' do |ss|
        ss.source_files = 'Source/**/*.swift', 'Pretty.swift'
    end

end
