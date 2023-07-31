### some abbreviations and 黑话解释:

dapp: decentralized application (can be full-stack)  
IC: internet computer  
dfx: developer experience, the IC-SDK 的 CLI  
Candid: 多个不同语言写的 canister 之间的 RPC 通信语言;an interface description language (IDL),a tool developed by DFINITY that allows different programs to communicate with each other on the Internet Computer.(Candid” does not appear to be an acronym or abbreviation, hah)  
CDK:Canister Development Kit ,主要是各个语言提供的操作 canister 的库,可以包含在 IC-SDK 里面,如 rust-CDK,python-CDK,typescript-CDK  
DAO:decentralized autonomous organization,就开发那个容器的公司名字,组织.统一抽象这类组织叫做 DAO.即那个 dapp 的软件开发组织  
DEX:Decentralized exchange , 即转账.  
DeFi:decentralized finance  
ECDSA: ECDSA API 是一种用于**生成和验证数字签名**的接口，它使用 ECDSA（Elliptic Curve Digital Signature Algorithm)  
LSDfi: Liquid Staking Derivatives Finance 的缩写，它指的是一些基于流动性质押衍生品（LSD）的 DeFi 协议，它们覆盖了 DeFi 生态系统的各个方面.  
stake,staking: 质押,如把 USD 换成 BTC 的行为.把 IC 币换成 neuron 的行为.在区块链中可以特指:锁定加密资产：这是一个名词，指的是将加密资产锁定在一个智能合约中，以获得一定的收益，并帮助维护区块链的安全性和稳定性;参与权益证明：这是一个动词，指的是通过锁定加密资产来参与基于权益证明（Proof of Stake）协议的区块链系统，并通过验证交易或创建区块来获得奖励  
NNS: Network Nervous System  
SNS: Service Nervous System  
这两个名词没有很准确的表述自己的服务范围: NNS 是整个 IC 的 stake 管理. SNS 是各个 dapp 自己的 stake 管理  
NNS：控制 Internet Computer 区块链的运行和发展。NNS 是一个去中心化和无需许可的治理系统，它可以通过提案和投票来决定区块链的各种参数，例如节点的奖励，子网的创建，协议的升级等.NNS 还可以通过分发代币（ICP）来激励社区成员参与治理，并通过转换代币（周期）来为智能合约提供计算资源.  
SNS：控制 Internet Computer 上的 dApp 和服务的运行和发展。SNS 是从 NNS 衍生出来的一种治理系统，它可以让每个 dApp 和服务拥有自己的代币化治理机制，让社区成员可以通过代币来参与决策和管理.。SNS 可以通过提案和投票来决定 dApp 和服务的各种功能，例如费用，参数，升级等.SNS 还可以用代币来奖励社区的贡献，或者用代币来购买服务.

#### some interesting fact:😊

HCI: human–computer interaction  
GUI: colorful ,with buttons and images,  
CLI: only text input and ouput  
normally call GUI as frontend.  
but Graphical User Interface by its\` name is not quite accurate diff with CLI. CLI could also be a kind of Graphical User Interface,use text to represent pictures,hah.

```
  (\(\
  ( -.-)
  o_(")(")

```

In theory, any language that can be compiled into a WebAssembly module, can produce modules tailored for the IC deployable as an ICP smart contract.

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

replica 原意副本,在这里 dfx 里面特指 Internet Computer local network binary  
这是啥? 本地链? 还是一个 http 服务器?功能类似 tomcat?nginx?  
本地运行的时候会保存之前的副本，比如你有部署一些程序，不会给你删掉，所以想删之前程序的话加个--clean

### How to use other backend language ?

By default backend use Mokoto.  
How to use rust (with webMVC) ?  
Or even Java , Python?  
目前 2023-7 对 Python 的 IC-SDK 支持不完善,说的没有稳定的中型项目用 python 部署在 IC 链上  
Java 直接没提到可能没有 IC-SDK-java  
todo  
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
