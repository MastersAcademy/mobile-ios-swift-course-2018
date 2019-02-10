==== Cocoapods =====
1. Install Cocoapods dependency without sudo
Source: https://stackoverflow.com/a/48962041
- Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

- Install OpenSSL 
echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
brew install openssl
brew upgrade openssl
which openssl
openssl version

- Install rbenv (add possibility to run different ruby versions)
rbenv install --list
rbenv install 2.5.1
rbenv versions
ruby --version
ruby --version

- Install cocoapods
gem install cocoapods -n /usr/local/bin
which pod
pod --version

2. Init cocoapods
pod init
pod repo update
pod install

3. Configure Podfile

Template:
# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'

target 'ToolingSample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ToolingSample
  #pod 'SwiftLint', '0.30.1'
  #pod 'Sourcery', '0.15.0'
  #pod 'R.swift', '5.0.2'

end


