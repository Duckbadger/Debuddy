Pod::Spec.new do |s|
  s.name             = 'Debuddy'
  s.version          = '0.0.1'
  s.summary          = 'Customisable debugging view tool.'
  s.description      = <<-DESC
  Debuddy allows you to easily display a customizable debugging view into your project
  without needing to tie debug code to production code.
                       DESC

  s.homepage         = 'https://github.com/KensFrequency/Debuddy'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Ken Boucher' => 'ken@kensfrequency.com' }
  s.source           = { :git => 'https://github.com/KensFrequency/Debuddy.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Debuddy/Debuddy/**/*.swift'
end