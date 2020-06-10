.PHONY: xcode cargo run install simulator-logs

LIB = rust/libdemo_ios.a
run: install
	xcrun simctl launch booted com.glutin.DemoIos

install: xcode
	xcrun simctl install booted build/Build/Products/Debug-iphonesimulator/DemoIos.app
	# Fails here build/Build/Products/Debug-iphonesimulator/DemoIos.app due to Ineligible destinations for the "DemoIos"

xcode: $(LIB)
	xcrun xcodebuild -scheme DemoIos -project DemoIos.xcodeproj/ -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 11 Pro,OS=13.2' -derivedDataPath build

cargo:
	make -C rust

simulator-logs:
	xcrun simctl spawn booted log stream --level=debug --predicate 'processImagePath endswith "DemoIos"'
ci:
	make -C rust ci
	xcrun xcodebuild -scheme DemoIos -project DemoIos.xcodeproj/ -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 11 Pro,OS=13.2' -derivedDataPath build


