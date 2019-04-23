# Uncomment the next line to define a global platform for your project
platform:ios,'9.0'

#project中不要有commomPods的target
abstract_target 'commonPods' do
  #这里写共用的第三方库
  pod 'MBProgressHUD', "~> 1.1.0"
  pod 'AFNetworking', "~> 3.2.1"
  pod 'AVOSCloud', "~> 11.6.1"
  target 'HFSDK' do
    #这里写SDK需要使用的第三方库
  end
  target 'HFSDK-Test' do
    #这里写测试工程里面需要使用的第三方库
  end
end