# MVX框架

### 前言

1、MVC   
苹果的 UIVieController 就是根据 MVC 框架来设计的，UIVieController 持有 View 跟 Model（自己实现），对于一个简单的页面而言在 UIVieController 负责处理业务逻辑，View 负责显示UI以及接受用户事件（并将事件传递给 UIVieController），Model负责存储数据。就这样一个 UIVieController 对应 一个 MVC 。   
但是，一旦这个页面变得稍微复杂一点， UIVieController 就会变得很”胖“。所以，当页面变得复杂时真的就不适合使用 MVC 了吗？并不是。最主要的原因是没有分模块，当页面比较复杂时，这个 UIVieController 更偏向与是一个负责展示页面的窗口（Screen）。   
此时的框架应该是这样的 UIVieController 包含了多个 MVC，每个 MVC 负责自己的业务，UIVieController 再将这些 MVC 的 View 组合成一个页面

MVC 是 C 持有 V 和 M
MVP 是 V 持有 P ，P 持有 M。（这里的V，可以是 UIView 或者 UIViewController，P需要操作V，所以也会持有V）
MVVM 是 V 持有 VM，VM 持有 M。（这里的V，可以是 UIView 或者 UIViewController）











