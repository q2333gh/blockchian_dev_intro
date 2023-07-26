fn main() {
    println!("Hello, world!");
    print_test();
}
#[ic_cdk::query]
fn print_test() {
    ic_cdk::print("Hello World from DFINITY!");
}
