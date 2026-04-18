# JZHU Trading Common

交易系统公共模块 - Java通用组件

## 简介

JZHU Trading Common 是交易系统的公共模块，提供通用的DTO类、响应对象、工具类等，供其他模块复用。

## 包含内容

### DTO类
- ErrorResponse - 错误响应对象
- KlineResponse - K线数据响应
- 各种业务数据传输对象

### 特性
- 统一的响应格式
- 标准的错误处理
- 便于模块间解耦

## 使用方式

作为Maven依赖引入:
```xml
<dependency>
    <groupId>ai.jzhu</groupId>
    <artifactId>trading-common</artifactId>
    <version>1.0.0</version>
</dependency>
```

## 许可证

MIT License