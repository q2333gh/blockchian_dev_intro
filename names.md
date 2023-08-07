### some abbreviations and 黑话解释:

dapp: decentralized application (can be full-stack)  
IC: internet computer  
dfx: developer experience, the IC-SDK 的 CLI  
Candid: 多个不同语言写的 canister 之间的 RPC 通信语言;an interface description language (IDL),a tool developed by DFINITY that allows different programs to communicate with each other on the Internet Computer.(Candid” does not appear to be an acronym or abbreviation, hah)  
CDK:Canister Development Kit ,主要是各个语言提供的操作 canister 的库,可以包含在 IC-SDK 里面,如 rust-CDK,python-CDK,typescript-CDK  
DAO:decentralized autonomous organization,就开发那个容器的公司名字,组织.统一抽象这类组织叫做 DAO.即那个 dapp 的软件开发组织  
DEX:Decentralized exchange , 即转账.  
DeFi:decentralized finance  
ECDSA: ECDSA API 是一种用于**生成和验证数字签名**的接口,它使用 ECDSA（Elliptic Curve Digital Signature Algorithm)  
LSDfi: Liquid Staking Derivatives Finance 的缩写,它指的是一些基于流动性质押衍生品（LSD）的 DeFi 协议,它们覆盖了 DeFi 生态系统的各个方面.  
stake,staking: 质押,如把 USD 换成 BTC 的行为.把 IC 币换成 neuron 的行为.在区块链中可以特指:锁定加密资产：这是一个名词,指的是将加密资产锁定在一个智能合约中,以获得一定的收益,并帮助维护区块链的安全性和稳定性;参与权益证明：这是一个动词,指的是通过锁定加密资产来参与基于权益证明（Proof of Stake）协议的区块链系统,并通过验证交易或创建区块来获得奖励  
NNS: Network Nervous System  
SNS: Service Nervous System  
这两个名词没有很准确的表述自己的服务范围: NNS 是整个 IC 的 stake 管理. SNS 是各个 dapp 自己的 stake 管理  
NNS：控制 Internet Computer 区块链的运行和发展.NNS 是一个去中心化和无需许可的治理系统,它可以通过提案和投票来决定区块链的各种参数,例如节点的奖励,子网的创建,协议的升级等.NNS 还可以通过分发代币（ICP）来激励社区成员参与治理,并通过转换代币（周期）来为智能合约提供计算资源.  
SNS：控制 Internet Computer 上的 dApp 和服务的运行和发展.SNS 是从 NNS 衍生出来的一种治理系统,它可以让每个 dApp 和服务拥有自己的代币化治理机制,让社区成员可以通过代币来参与决策和管理..SNS 可以通过提案和投票来决定 dApp 和服务的各种功能,例如费用,参数,升级等.SNS 还可以用代币来奖励社区的贡献,或者用代币来购买服务.  
IC-neuron hotkey : 是一种可以用来做一些非关键的治理操作（例如投票和查询成熟度）的密钥,而不需要使用控制器的密钥.

## actor:

An actor is a special kind of object that processes messages in an isolated state, enabling messages to be handled remotely and asynchronously.  
actor 是 mokoto 独有的.但是在 rust 里面有类似的 object

![Alt text](image-11.png)
