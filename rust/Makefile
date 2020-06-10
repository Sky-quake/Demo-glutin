
CARGO_MODE ?= debug
LIB = libdemo_ios.a

all:
	cargo lipo
	cp ./target/universal/debug/$(LIB) ./

doc:
	cargo doc --target aarch64-apple-ios --open

ci:
	cargo build --target x86_64-apple-ios
	cp ./target/x86_64-apple-ios/debug/$(LIB) ./

# Using nightly and fixing by hand some compile fails
android:
	cargo apk run