# dfx intro

## install dfx

```sh
sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
# or:(if encounter net problem)
wget https://github.com/dfinity/sdk/releases/download/0.14.3/dfx-0.14.3-x86_64-linux.tar.gz

# mention the dfx version,maybe you should use latest.
# v0.14.3 just for 2023-7


```

## IC-canister running tutorial:

```sh
dfx new hello # create a example project "hello"
cd hello
dfx start --background

# deploy:
npm install # install all dependencies locally
dfx deploy #start backend and frontend program

#testing:
dfx canister call hello_backend greet everyone
# greet -> backend_controller_name
# everyone -> the param to send with that controller(function on the server)
# receive from the terminal output:
# ("Hello, everyone!")

#stop:
dfx stop
```

### IC-dapp-rust_backend

```sh
dfx new --type=rust ICVote
cd ICVote
dfx start --background
dfx deploy
# IC-rust 后端必须用到这个:
rustup target add wasm32-unknown-unknown

```

replica 原意副本,在这里 dfx 里面特指 Internet Computer local network binary  
这是啥? 本地链? 还是一个 http 服务器?功能类似 tomcat?nginx?  
本地运行的时候会保存之前的副本,比如你有部署一些程序,不会给你删掉,所以想删之前程序的话加个--clean

### How to use other backend language ?

By default backend use Mokoto.  
How to use rust (with webMVC) ?  
Or even Java , Python?  
目前 2023-7 对 Python 的 IC-SDK 支持不完善,说的没有稳定的中型项目用 python 部署在 IC 链上  
IC-SDK-java:
现在有一个叫 ic4j 的 ic java agent: https://github.com/ic4j/ic4j-agent

Some IC-rust project maybe:
https://github.com/usergeek/canistergeek_ic_rust  
IC-app-flutter:全栈,并且有用户资产相关,如他们的 ME 那个软件  
https://github.com/AstroxNetwork/agent_dart

## Deploy dapp on IC-chain(on the Internet)

todo

### use IC-chain need resource

需要 nodes:由物理机(CPU,RAM,Storage),和网络,电力的计算节点  
所以需要钱: 用 IC 的 cryptcurrncy 来换取成另一种币:他们称为 Cycle,然后你有一个 Cycle wallet,用来支付运行 canister 的费用  
USD >> IC-cryptoconcurrency >> cycle >> run canister  
另外 IC 会免费送点 cycles 第一次使用的时候:
https://internetcomputer.org/docs/current/developer-docs/setup/cycles/cycles-faucet

## IC compile all codes into WASM

# IC-SDK-APIs of Rust

## queries:

对于普通信息:如博客,问答,可以在链上传输  
例子:
if you are developing a blogging platform, queries that retrieve articles matching a tag probably don’t warrant going through consensus(共识) to ensure that a majority of nodes agree on the results.意思是?可能各个链上数据不是完全同步的?  
这里的共识关系到 block-chain 的共识算法嘛?还是什么意思?

对于敏感信息,如账单交易,需要做**certified queries**,enable you to receive **authenticated responses**.

基于区块链,所有的 DB 数据都是存在链上的吗?  
canister 只是在负责做函数计算吗?

## queries 的数据来源:Data Storage

query 查询的是 IC 特别命名的 stable memory,这里的 memory 不是指普遍意义 CS 中的内存条,😅  
但是反正可以抽象为:
**一个稳定存储的 byte 数组,任何 canister 都可以来 CRUD**,  
怎么实现的目前不了解,用就完事儿了.  
可能是存在链上的.

#### 一些最大存储限制

如单词网络发送容量,链上存储容量,RPC 交互节点量,wasm 最大文件大小等:https://internetcomputer.org/docs/current/developer-docs/backend/resource-limits

## IC-SDK-Rust

ref: https://github.com/dfinity/cdk-rs

intro:
A canister is a WebAssembly (wasm) module that can run on the Internet Computer.

# 整个 dapp 工程需要测试和本地模拟区块链

How?  
使用本地链上面的 IC 的货币,neuron,hotkey,等  
做 不同账户不同容器间的 CRUD.

如何 debug 一个 dapp??  
debug 一个 dapp 是在 debug 一个 rust-wasm 程序吗?

```

```
