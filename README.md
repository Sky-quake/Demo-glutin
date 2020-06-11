# DemoIos.app

## Setup

1. Install Rust `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
2. Install `cargo-lipo` via `cargo install cargo-lipo`
3. Install ios targets:
```sh
# 64 bit targets (real device & simulator):
rustup target add aarch64-apple-ios x86_64-apple-ios
# 32 bit targets (you probably don't need these):
rustup target add armv7-apple-ios i386-apple-ios
```

## Building with `make` - NOT WORKING
* `make cargo xcode` will build the xcode project and put it in `build/Build/Products/Debug-iphonesimulator/DemoIos.app`
* `make run` install and run the app in a simulator that's booted.
* `make simulator-logs` will give you way too many logs from the simulator.

## Building with xcode buttons
* `cd rust && make`
* `open DemoIos.xcodeproj` and push the play button.
