# MVC

苹果的 UIVieController 就是根据 MVC 框架来设计的，UIVieController 持有 View 跟 Model（自己实现），对于一个简单的页面而言在 UIVieController 负责处理业务逻辑，View 负责显示UI以及接受用户事件（并将事件传递给 UIVieController），Model负责存储数据。就这样一个 UIVieController 对应 一个 MVC 。   
但是，一旦这个页面变得稍微复杂一点， UIVieController 就会变得很“胖”。所以，当页面变得复杂时真的就不适合使用 MVC 了吗？并不是。最主要的原因是没有分模块，当页面比较复杂时，这个 UIVieController 更偏向与是一个负责展示页面的窗口（Screen）。此时的框架应该是这样的，一个 UIVieController 包含了多个 MVC，每个 MVC 负责自己的业务，UIVieController 再将这些 MVC 的 View 组合成一个页面

### 庞大的 C
苹果的 MVC 中， C 包含了大量的代码，包括：设置 View 的代码，监听 Model 的代码，网络相关业务逻辑，页面跳转逻辑，这些都是在 C 中实现的。Model 中仅仅包含一些数据，简简单单的一个瘦Model，或者会将部分数据组装、格式化的逻辑放在 Model 中，让这个 Model 慢慢变成胖Model。
而在传统的 MVC 中，Model 是负责网络相关的业务逻辑的，获取数据通过 Model 提供的接口异步获取，所有跟数据相关的逻辑都应该放在 Model 中。这样做似乎更加合理，但是在iOS开发中却很少见到这样的代码

### 分离 C 中的代码
1. 设置 View 的代码 可以放在 View 里面（或者View分类），事实上我见到的代码很多都是这样做的，甚至不可避免的在 View 中 还会包含一些简单的展示逻辑。此时也可以将监听的代码放在 View 中实现，但是考虑到苹果原生的 KVO 好多坑，这里可以用 Facebook 的 KVOController 这个库。
2. 网络逻辑本应该放在 Model 中的，但是没放，所以可以将网络逻辑抽出来放在一个单独的文件中，将返回的数据处理好后再交给 Model
3. 分模块，很多 MVC 之所以会“肿”，是因为将 UIVieController 完全当成 C 了，对于一些业务分开的界面，完全可以写成一个单独 MVC
 这样更加合理，也方便修改。对于很复杂的页面，例如包含 UITableView 的页面，就应该将 UITableView 相关的逻辑写成一个 MVC ，每一种不同的类型的 UITableViewCell 写成一种 MVC ，最终变成 UITableView（MVC）+ N中类型UITableViewCell（MVC）。（PS：实际上项目中这里我都写成 MVC + MVVM 了，不过思想是一样的）
 
### 优点
1. 简单，很容易上手
2. 相比于其他框架，MVC代码量最少，非常适用于一些业务简单的页面

### 缺点
1. 不太适用于较复杂的页面
2. 业务逻辑都写在 C 中，很难对 C 进行单元测试。
