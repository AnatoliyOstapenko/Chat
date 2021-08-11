platform :ios, '13.0'

target 'Chat' do
  use_frameworks!

  # Pods for Chat - set animation for labels
  # after string pod 'CLTypingLabel' check the last version on CocoaPods
  # to updated up to new version (avoid errors pop up in project)
  # in this case added ", '~> 0.4.0'"
  pod 'CLTypingLabel', '~> 0.4.0'
  
  # to solve the problem with the unexpected appearance of the keyboard
  pod 'IQKeyboardManager', '~> 6.5.0'
  
  
  # added Authentication from Firebase SDK
  pod 'Firebase/Auth'
  # added Cloud Firestore from Firebase SDK
  pod 'Firebase/Firestore'
  
  # fixed many pop-up errors:
  post_install do |installer|
   installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
     config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
    end
   end
  end


end
