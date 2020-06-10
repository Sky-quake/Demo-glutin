mod support;
mod engine;

use engine::main;

#[no_mangle]
pub extern "C" fn run_app() {
    main();
}
