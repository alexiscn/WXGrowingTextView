Pod::Spec.new do |s|
  s.name         = 'WXGrowingTextView'
  s.version      = '0.0.2'
  s.license = 'MIT'
  s.requires_arc = true
  s.source = { :git => 'https://github.com/alexiscn/WXGrowingTextView.git', :tag => s.version.to_s }

  s.summary         = 'WXGrowingTextView'
  s.homepage        = 'https://github.com/alexiscn/WXGrowingTextView'
  s.license         = { :type => 'MIT' }
  s.author          = { 'alexiscn' => 'alexiscn@example.com' }
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.source_files    =  'Sources/**/*.{swift}'
  s.ios.deployment_target = '12.0'
  
end
