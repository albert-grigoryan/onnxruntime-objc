Pod::Spec.new do |spec|
  spec.name = 'onnxruntime-objc'
  spec.version = '1.14.0'
  spec.summary = 'ONNX Runtime Objective-C Pod'
  spec.description = 'A pod for the ONNX Runtime Objective-C API.'
  spec.homepage = 'https://github.com/albert-grigoryan/onnxruntime-objc'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors = { 'Albert Grigoryan' => 'albert_grigoryan@yahoo.com' }
  spec.source  = { :git => 'https://github.com/albert-grigoryan/onnxruntime-objc.git', :tag => spec.version.to_s }
  
  spec.platforms = { :ios => '11.0' }
  
  spec.preserve_paths = ['LICENSE']
  
  spec.default_subspecs = 'Core'
  spec.static_framework = true
  
  spec.subspec 'Core' do |subspec|
    subspec.dependencies = { 'onnxruntime-c' => ['1.14.0'] }
    subspec.requires_arc = true
    subspec.compiler_flags = [
      '-std=c++17',
      '-fobjc-arc-exceptions',
      '-Wall',
      '-Wextra',
      '-Werror'
    ]
    
    subspec.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}/objectivec"',
      'OTHER_CPLUSPLUSFLAGS' => '-fvisibility=hidden -fvisibility-inlines-hidden'
    }
    
    subspec.public_header_files = ['objectivec/include/*.h']
    
    subspec.source_files = [
      'objectivec/include/*.h',
      'objectivec/src/*.h',
      'objectivec/src/*.m',
      'objectivec/src/*.mm'
    ]
    
    subspec.testspecs 'Tests' do |testspecs|
      testspecs.test_type = 'unit'
      testspecs.source_files = [
        'objectivec/test/*.h',
        'objectivec/test/*.m',
        'objectivec/test/*.mm'
      ]
      
      testspecs.resources = ['objectivec/test/testdata/*.ort']
    end
  end
end
