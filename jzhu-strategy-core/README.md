# JZHU Strategy Core

量化交易策略核心模块

## 简介

JZHU Strategy Core 是交易系统的策略核心引擎，实现各种量化交易策略的计算逻辑。

## 核心功能

- 策略计算 - 各种技术指标计算
- 信号生成 - 买卖信号识别
- 风险管理 - 仓位控制、止损计算
- 回测支持 - 历史数据回测

## 技术特点

- 高性能计算
- 模块化设计
- 易于扩展

## 使用

```java
StrategyContext context = new StrategyContext();
context.setSymbol("BTCUSDT");
StrategyResult result = strategy.execute(context);
```

## 许可证

MIT License