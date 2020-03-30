.DEFAULT_GOAL := help
BUNDLE=$(if $(rbenv > /dev/null), rbenv exec bundle, bundle)
FASTLANE=$(BUNDLE) exec fastlane
PROJECT_PATH=Collecionarium.xcodeproj/project.pbxproj

setup_bundle: ## install bundle and update it
	gem install bundler && bundle update

install: ## install required dependencies
	make install_bundle
	$(FASTLANE) install

install_bundle: ## install gems
	$(BUNDLE) install

uniquify: ## uniquify and sort the pbxproj file using xUnique.py script
	python build-scripts/xUnique.py -usp $(PROJECT_PATH)

xcode_wipe: ## delete all xcode cached outputs, kill and reset all simulators
	-rm -rf ~/Library/Developer/Xcode/{DerivedData,Archives,Products}
	make reset_simulator
	
reset_simulator: ## reset all iOS Simulators
	-osascript -e 'tell application "Simulator" to quit'
	-xcrun simctl shutdown all
	-xcrun simctl erase all

pods_wipe: ## removes Pods folder, clean its cache and reinstall all Cocoapods dependencies
	pod cache clean --all
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf ~/Library/Caches/CocoaPods/*
	$(FASTLANE) pods_install

reset_profiles: ## removes all Provisioning profiles currently installed
	rm -rf ~/Library/MobileDevice/Provisioning\ Profiles/*
	make install_certificates

install_certificates: ## fetch and install certificates for code signing
	$(FASTLANE) fetch_certificates

test_xcov: ## run unit tests
	$(FASTLANE) test_xcov

test_slather: ## run unit tests
	$(FASTLANE) test_slather

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'