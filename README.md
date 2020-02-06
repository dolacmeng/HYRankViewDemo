
## 介绍

排序按钮，使用Core Graphic绘制，可以指定颜色、大小、字体等：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200206162022739.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RvbGFjbWVuZw==,size_16,color_FFFFFF,t_70)

使用场景如下：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200206161835674.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RvbGFjbWVuZw==,size_16,color_FFFFFF,t_70)

## 1.使用方法
将HYRankView.h和HYRankView.m拖入工程。
然后使用如下代码，即可快速添加一个名称为价格的排序按钮
```objectivec
HYRankView *view = [HYRankView viewWithTitle:@"价格" frame:CGRectMake(0,100,80,40)];
[self.view addSubview:view];
```
排序按钮默认是未选中状态，只需要一行代码即可改变排序按钮状态。


![在这里插入图片描述](https://img-blog.csdnimg.cn/20200206171956474.png)
## 2.改变选中状态
只要调用makeOpposite方法：

```objectivec
[view makeOpposite];
```
即可改为按“高到低”的选中状态：


![在这里插入图片描述](https://img-blog.csdnimg.cn/20200206165023168.png)

再调用一次makeOpposite方法，即会改为按“低到高”的选中状态，所以makeOpposite的功能为改变排序方式。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200206165302709.png)

但是点击排序按钮，并没有任何响应，为此我们需要添加一个点击事件。

## 3.添加点击事件
HYRankView继承自UIControl，可以像UIButton等控件一样添加响应事件：

```objectivec
[view addTarget:self action:@selector(clickPrice:) forControlEvents:UIControlEventTouchUpInside];
```
实现clickPrice：，在方法中调用makeOpposite方法改变排序状态

```objectivec
-(void)clickPrice:(HYRankView*)sender{
    [sender makeOpposite];
}
```

## 4.改变按钮UI
如下代码，创建名称为销量的排序按钮，并改变字体颜色、三角形大小、选中和非选中颜色：
```objectivec
    HYRankView *view2 = [HYRankView viewWithTitle:@"销量" frame:CGRectMake(200,100,120,40)];
    view2.textFont = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    view2.triangleW = 20;
    view2.selectColor = [UIColor redColor];
    view2.unselectColor = [UIColor blackColor];
    [view2 addTarget:self action:@selector(clickSaleCount:) forControlEvents:UIControlEventTouchUpInside];
    [view2 makeOpposite];
    [self.view addSubview:view2];
    self.view2 = view2;
```
运行效果：

![在这里插入图片描述](https://img-blog.csdnimg.cn/2020020617055614.png)
