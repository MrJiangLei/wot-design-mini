## Tooltip 文字提示

常用于展示提示信息。

### 引入

```json
{
  "usingComponents": {
    "wd-tooltip": "/wot-design/tooltip/index"
  }
}
```

### 基本用法

在这里我们提供 12 种不同方向的展示方式，可以通过以下完整示例来理解。

`show` 控制是否展示文字提示。监听 `bind:change` 事件获取新值。

使用`content`属性来决定显示时的提示信息。

由`placement`属性决定展示效果：

- `placement`属性值为：`方向-对齐位置`；
- 四个方向：`top`、`left`、`right`、`bottom`；
- 三种对齐位置：`start`、''(默认空为居中)、 `end`；

如 `placement="left-end"`，则提示信息出现在目标元素的左侧，且提示信息的底部与目标元素的底部对齐。

```html
<wd-tooltip show="{{ show }}" bind:change="handleChange" placement="top" content="top 提示文字">
  <wd-button>top</wd-button>
</wd-tooltip>
```

```javascript
Page({
  data: {
    show: false
  },
  handleChange (event) {
    this.setData({ show: event.detail.show })
  }
})
```

### 更多 Content

展示多行文本或者是设置文本内容的格式

用具名 slot 分发`content`，替代 `tooltip` 中的 `content` 属性。

使用插槽时，请使用 `useContentSlot` 属性，确定 `content` 插槽开启。

```html
<wd-tooltip show="{{ show }}" bind:change="handleChange" placement="right" useContentSlot>
  <wd-button >多行文本</wd-button>
  <view slot="content" style="color: red; padding: 5px; width: 90px">
    <view>多行文本1</view>
    <view>多行文本2</view>
    <view>多行文本3</view>
  </view>
</wd-tooltip>
```

```javascript
Page({
  data: {
    show: false
  },
  handleChange (event) {
    this.setData({ show: event.detail.show })
  }
})
```

### 显示关闭按钮

Tooltip 组件通过属性`show-close` 控制是否显示关闭按钮。

```html
<wd-tooltip show="{{show}}" content="显示关闭按钮" show-close bind:change="handleChange">
  <wd-button >显示关闭按钮</wd-button>
</wd-tooltip>
```

```javascript
Page({
  data: {
    show: false
  },
  handleChange (event) {
    this.setData({ show: event.detail.show })
  }
})
```

### 高级扩展

除了这些基本设置外，还有一些属性可以让使用者更好的定制自己的效果：

如果需要关闭 `tooltip` 功能，`disabled` 属性可以满足这个需求，它接受一个`Boolean`，设置为`true`即可。

```html
<wd-tooltip show="{{ show }}" bind:change="handleChange" placement="right-end" content="禁用" disabled>
  <wd-button >禁用</wd-button>
</wd-tooltip>
```

### 控制位置

**注意：由于微信小程序无法动态插入节点，因此文字气泡位置会根据传入定位的节点最外层位置对齐，如果文字提示位置不在您想要渲染的位置上，可以通过控制组件整体位置达到想要的效果。**
错误用法示例：

```html
<wd-tooltip placement="top" content="top 提示文字" >
  <wd-button style="margin-left: 100px">top</wd-button>
</wd-tooltip>
<wd-tooltip placement="top" content="top 提示文字" >
  <wd-button style="position: absolute; left: 100px;">top</wd-button>
</wd-tooltip>
```

正确用法：

```html
<wd-tooltip placement="top" content="top 提示文字" style="margin-left: 100px">
  <wd-button>top</wd-button>
</wd-tooltip>
<wd-tooltip placement="top" content="top 提示文字" style="position: absolute; left: 100px;">
  <wd-button>top</wd-button>
</wd-tooltip>
```

### Tooltip Attributes

| 参数               | 说明                                                     | 类型              | 可选值      | 默认值 |
|--------------------|----------------------------------------------------------|-------------------|-------------|--------|
|  show |  状态是否可见  | Boolean           | — |  false |
|  content        |  显示的内容，也可以通过 `slot#content` 传入  | String/Array            | — | — |
|  placement        |  Tooltip 的出现位置  | String           |  top/top-start/top-end/bottom/bottom-start/bottom-end/left/left-start/left-end/right/right-start/right-end |  bottom |
|  disabled       |  Tooltip 是否可用  | Boolean           | — |  false |
|  visible-arrow   |  是否显示 Tooltip 箭头 | Boolean | — | true |
|  offset        |  出现位置的偏移量  | Number           | — |  5 |
|  show-close   |  是否显示 Tooltip 内部的关闭按钮 | Boolean | — | false |

### Events

| 事件名称           | 说明             | 回调参数                                     |
| -------------- | -------------- | ---------------------------------------- |
| open     |显示时触发       | - |
| close | 隐藏时触发 | - |
| change | 显隐值变化时触发 | - |

### Methods

| 方法名称      | 说明       | 参数   |
|------------- |----------- |---------  |
| open | 打开文字提示弹框 |
| close | 关闭文字提示弹框 |

### Slot

| name      | 说明       |
|------------- |----------- |
| content | 多行内容或用户自定义样式 |

### Tooltip 外部样式类

| 类名     | 说明                |
|---------|---------------------|
| custom-class | 根结点样式 |
| custom-arrow | 尖角样式 |
| custom-pop | 文字提示样式 |
