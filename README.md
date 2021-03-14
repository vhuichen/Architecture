# MVC、MVP、MVVM框架

## MVC
苹果的 UIVieController 就是根据 MVC 框架来设计的，UIVieController 持有 View 跟 Model（自己实现），对于一个简单的页面而言在 UIVieController 负责处理业务逻辑，View 负责显示 UI 以及接受用户事件，并将事件传递给 UIVieController，而 Model 负责存储数据。

### 庞大的 C
苹果的 MVC 中， C 包含了大量的代码，包括：设置 View 的代码，监听 Model 的代码，网络相关业务逻辑，页面跳转逻辑，这些都是在 C 中实现的。Model 中仅仅包含一些数据，简简单单的一个瘦Model，或者可以将部分数据组装、格式化的逻辑放在 Model 中，让这个 Model 慢慢变成胖Model。
而在传统的 MVC 中，Model 是负责网络相关的业务逻辑的，数据通过 Model 提供的接口异步获取，所有跟数据相关的逻辑都应该放在 Model 中。这样做似乎更加合理，但是我在 iOS 开发中却很少见到这样的代码

### 分离 C 中的代码
1. 设置 View 的代码 可以放在 View 里面（或者 View 分类），事实上我见到的代码很多都是这样做的，甚至不可避免的在 View 中 还会包含一些简单的展示逻辑。此时也可以将监听的代码放在 View 中实现。考虑到苹果原生的 KVO 好多坑，这里可以用 Facebook 的 KVOController 这个库。
2. 网络逻辑本应该放在 Model 中的，但是没放，所以可以将网络逻辑抽出来放在一个单独的文件中，将返回的数据处理好后再交给 Model
3. 分模块，很多 MVC 之所以会“肿”，是因为将 UIVieController 完全当成 C 了，对于一些业务分开的界面，完全可以单独写成一个 MVC 。
 这样更加合理，也方便修改。对于很复杂的页面，例如包含 UITableView 的页面，就应该将 UITableView 相关的逻辑写成一个 MVC ，每种不同的类型的 UITableViewCell 写成一个 MVC ，最终变成 UITableView（MVC）+ N种类型的 UITableViewCell（MVC）。（PS：实际上项目中这里我都写成 MVC + MVVM 了，不过思想是一样的）
 
### 优点
1. 简单，很容易上手
2. 相比于其他框架，MVC代码量最少，非常适用于一些业务简单的页面

### 缺点
1. 不太适用于较复杂的页面
2. 业务逻辑都写在 C 中，但 C 和 V 紧密联系在一起，边界缺失，很难对 C 进行单元测试。想象一下，假如现在需要测试 C ，那么 C 的接口在哪里？


## MVP
MVP 改进了 MVC，将原来 C 中的业务移到 P 中，V 和 P 通过接口通信 ，感觉好像跟 MVC 没什么区别啊！？？其实是有的，
最明显的区别就是 MVP 中可以对 P 跟 M  进行单元测试，V 持有 P ，P 持有 M，这样我们很容易模拟 V ， 从而对 P 跟 M 进行单元测试。

### 优点
1. 易测试，可以对 P 跟 M  进行单元测试

### 缺点
1. V 和 P 之间引入了大量的接口


## MVVM
MVVM 改进了 MVP，通过双向绑定机制解决了 MVP 接口很多的问题，MVVM 中的 VM 对应 MVP 的 P，负责处理业务逻辑。通过绑定机制，当 M 发生改变时更新 VM ，VM 发生改变时更新 V ，这些数据更新都不需要通过接口实现。在 iOS 中，这种绑定机制可以用 ReactiveCocoa 或者用 Facebook 的 KVOController + KVC 实现。
PS：使用 Swift 自身的特性应该可以更好地实现 MVVM，但由于本人目前不太熟悉 Swift ，Demo 中并没有使用 Swift 自身的特性

### 优点
1. 易测试，可以对 VM  进行单元测试
2. 双向绑定简化代码

### 缺点
1. 双向绑定使得查找 bug 变难


### MVVM  vs  MVC-VM
在实际开发中不使用绑定机制也可以将数据相关的业务放在 VM 中，这样整个框架看起来就像是 MVC-VM，同样也可以对 VM 进行单元测试。在不使用 ReactiveCocoa 的情况下，这种代码框架在我接触的项目中占比很大，其实很多文章把这种代码框架也叫做 MVVM


## 总结
1. MVC 简单易上手，但很难进行单元测试（其实，项目开发本来就很少单元测试，甚至没有）
2. MVP 改进了 MVC ，使得 MVP 很容易进行单元测试，但同时也使得 V 和 P 之间出现一堆交互接口
3. MVVM 改进了 MVP，使用双向绑定简化了 V 和 P 之间的交互接口
4. 在没有使用 ReactiveCocoa 等框架的情况下，使用没有绑定机制的 MVVM（MVC-VM） 也是个不错的选择

### Demo
[Demo](https://github.com/vhuichen/Architecture) 写的有点菜，主要是我想用 Swift 来写，但是又写不好的样子（典型的又菜又爱玩）。
