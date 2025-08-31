platform :ios, '15.6'
use_frameworks!

source 'git@github.com:CocoaPods/Specs.git'

# Flutter 模块配置
flutter_application_path = File.expand_path('../../flutter_tool', __FILE__)

# 验证路径
if !File.exist?(flutter_application_path)
  raise "Flutter 模块路径不存在: #{flutter_application_path}"
end

# 检查 podhelper.rb 是否存在
podhelper_path = File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
if !File.exist?(podhelper_path)
  raise "Podhelper 文件不存在: #{podhelper_path}"
end

load podhelper_path

target 'Tool' do
  # 第三方依赖
  pod 'SnapKit'
  pod 'RxSwift'
  pod 'RxCocoa'
  
  # Flutter 依赖
  install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
  # 添加 Flutter 后处理
  flutter_post_install(installer) if defined?(flutter_post_install)
  
  # 设置最低部署版本
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.6'
    end
  end
end