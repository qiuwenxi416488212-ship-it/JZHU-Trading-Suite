# JZHU Trading Suite
## 量化交易全栈系统 | 完整交易解决方案

<p align="center">
  <img src="https://img.shields.io/github/stars/XiLi/JZHU-Trading-Suite" alt="Stars">
  <img src="https://img.shields.io/github/license/XiLi/JZHU-Trading-Suite" alt="License">
  <img src="https://img.shields.io/badge/Java-17%2B-blue" alt="Java">
  <img src="https://img.shields.io/badge/Vue-3-green" alt="Vue">
  <img src="https://img.shields.io/badge/Spring%20Boot-3.x-brightgreen" alt="Spring Boot">
</p>

---

## 📦 项目简介

**JZHU Trading Suite** 是一套完整的量化交易系统,专门为交易者打造的全功能平台。无论你是量化交易新手还是专业开发者,这个系统都能帮助你快速构建自己的交易系统。

> **让量化交易变得更简单!**

---

## 🎯 项目目标

- 提供完整的行情数据服务
- 简化策略开发和回测
- 构建可视化交易界面
- 一键部署运维

---

## 🏗️ 系统架构

```
┌────────────────────────────────────────────────────────────────────┐
│                        JZHU Trading Suite                          │
│                         量化交易全栈系统                            │
├────────────────────────────────────────────────────────────────────┤
│                                                                   │
│   ┌────────────────┐    ┌────────────────┐    ┌────────────────┐  │
│   │                │    │                │    │                │  │
│   │  Web Frontend  │◄──►│  Market Data   │◄──►│    Strategy    │  │
│   │    (Vue3)      │    │    Service     │    │     Core       │  │
│   │                │    │  (Spring Boot) │    │    (Java)      │  │
│   │  实时行情展示   │    │   K线数据API   │     │  技术指标计算   │  │
│   │  K线图表        │    │   实时行情     │     │  买卖信号生成  │   │
│   │  交易记录       │    │   数据缓存     │     │  风险管理      │   │
│   │                │    │                │    │                │   │
│   └────────────────┘    └────────────────┘    └────────────────┘   │
│           │                      │                      │          │
│           └──────────────────────┼──────────────────────┘          │
│                                  ▼                                 │
│                    ┌────────────────────────┐                      │
│                    │        Database        │                      │
│                    │    (MySQL/PostgreSQL)  │                      │
│                    │    K线数据/交易记录     │                      │
│                    └────────────────────────┘                      │
│                                                                    │
└────────────────────────────────────────────────────────────────────┘
```

---

## 📂 包含模块详解

### 1️⃣ jzhu-market-service - 行情数据服务

**技术栈:** Java 17 + Spring Boot 3.x + Maven

**核心功能:**
- 🌐 **RESTful API** - 标准化的Web接口
- 📊 **K线数据** - 支持日线、小时线、分钟线等多种周期
- 💹 **实时行情** - 获取最新交易价格和24小时涨跌
- ⚡ **数据缓存** - 高性能缓存,提升查询速度
- ❤️ **健康检查** - 服务状态监控

**核心类:**
- `MarketDataApplication.java` - 启动入口
- `KlineController.java` - K线数据接口

**启动方式:**
```bash
cd jzhu-market-service
mvn spring-boot:run
```

**API示例:**
```bash
# 获取K线数据
GET /api/kline?symbol=BTCUSDT&period=1h&limit=100

# 获取实时行情
GET /api/quote?symbol=BTCUSDT

# 健康检查
GET /health
```

---

### 2️⃣ jzhu-trading-common - 公共模块

**技术栈:** Java + Spring Boot

**核心功能:**
- 📦 **统一响应格式** - 标准化的API响应结构
- ❌ **错误处理** - ErrorResponse统一错误响应
- 📊 **数据传输对象** - KlineResponse等业务DTO
- 🔄 **模块复用** - 供其他模块引用,减少重复代码

**核心类:**
- `ErrorResponse.java` - 错误响应对象
- `KlineResponse.java` - K线数据响应

**使用方式:**
```xml
<dependency>
    <groupId>ai.jzhu</groupId>
    <artifactId>trading-common</artifactId>
    <version>1.0.0</version>
</dependency>
```

```java
// 使用统一响应
ErrorResponse error = ErrorResponse.builder()
    .code(400)
    .message("参数错误")
    .build();

KlineResponse response = KlineResponse.builder()
    .symbol("BTCUSDT")
    .klines(klineList)
    .build();
```

---

### 3️⃣ jzhu-strategy-core - 策略核心引擎

**技术栈:** Java

**核心功能:**
- 📈 **技术指标** - MA、EMA、RSI、MACD、Bollinger Bands等
- 🎯 **信号生成** - 基于指标的买卖信号识别
- 🛡️ **风险管理** - 仓位计算、止损止盈
- 🔬 **回测支持** - 历史数据回测验证策略
- ⚡ **高性能** - 优化计算性能

**功能说明:**

| 功能 | 说明 |
|------|------|
| 移动平均线 | MA5, MA10, MA20, MA60 |
| 指数移动平均 | EMA快速响应 |
| 相对强弱指标 | RSI超买超卖判断 |
| MACD | 趋势判断金叉死叉 |
| 布林带 | 突破信号 |
| ATR | 波动率计算 |

**使用示例:**
```java
// 创建策略上下文
StrategyContext context = new StrategyContext();
context.setSymbol("BTCUSDT");
context.setPeriod("1h");
context.setIndicators(Arrays.asList("MA", "RSI", "MACD"));

// 执行策略
StrategyResult result = strategyEngine.execute(context);

// 获取信号
if (result.getSignal() == Signal.BUY) {
    System.out.println("买入信号触发!");
}
```

---

### 4️⃣ jzhu-web-app - 前端应用

**技术栈:** Vue 3 + Vite + JavaScript + Axios + Pinia

**核心功能:**
- 📊 **实时行情** - 实时更新的价格显示
- 📈 **K线图表** - 交互式K线走势
- 💹 **交易记录** - 账户交易历史
- ⚙️ **系统设置** - 个性化配置
- 🔔 **数据刷新** - 自动刷新最新数据

**项目结构:**
```
jzhu-web-app/
├── src/
│   ├── components/     # 可复用组件
│   ├── views/          # 页面视图
│   │   ├── Home.vue           # 首页/行情
│   │   ├── Chart.vue          # K线图表
│   │   ├── Trade.vue          # 交易记录
│   │   └── Settings.vue       # 设置
│   ├── services/       # API服务
│   │   └── api.js             # API调用
│   ├── stores/         # 状态管理
│   └── App.vue         # 根组件
├── package.json
└── vite.config.js
```

**启动方式:**
```bash
cd jzhu-web-app

# 安装依赖
npm install

# 开发模式
npm run dev

# 生产构建
npm run build
```

**功能界面:**

1. **行情首页** - 展示所有交易对实时价格
2. **K线图表** - 可缩放、平移的K线图
3. **交易记录** - 买入卖出历史
4. **系统设置** - 主题、刷新频率等配置

---

### 5️⃣ jzhu-db-scripts - 数据库脚本

**数据库:** MySQL 8.0+

**核心功能:**
- 📋 **表结构设计** - 优化的数据库表
- 🔧 **索引优化** - 快速查询
- 📊 **初始数据** - 基础数据导入

**主要表:**

| 表名 | 说明 |
|------|------|
| kline | K线(OHLC)数据表 |
| quote | 实时行情数据 |
| trade | 交易记录 |
| signal | 策略信号记录 |

**SQL脚本说明:**

```sql
-- K线数据表
CREATE TABLE kline (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    symbol VARCHAR(20) NOT NULL,      -- 交易对 BTCUSDT
    period VARCHAR(10) NOT NULL,      -- 周期 1h, 4h, 1d
    open DECIMAL(20, 8) NOT NULL,    -- 开盘价
    high DECIMAL(20, 8) NOT NULL,    -- 最高价
    low DECIMAL(20, 8) NOT NULL,     -- 最低价
    close DECIMAL(20, 8) NOT NULL,   -- 收盘价
    volume DECIMAL(30, 8) NOT NULL,  -- 成交量
    time DATETIME NOT NULL,           -- 时间
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_symbol_period (symbol, period),
    INDEX idx_time (time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

**使用方式:**
```bash
# 创建数据库
mysql -u root -p -e "CREATE DATABASE trading CHARACTER SET utf8mb4;"

# 初始化表结构
mysql -u root -p trading < jzhu-db-scripts/01_init_kline.sql
```

---

### 6️⃣ jzhu-scripts - 运维脚本

**功能:**
- 🚀 **一键启动** - 启动所有服务
- 🛑 **一键停止** - 停止所有服务
- 📊 **状态查看** - 查看运行状态

**脚本说明:**

| 脚本 | 功能 |
|------|------|
| start.bat | Windows启动脚本 |
| stop.bat | Windows停止脚本 |
| status.bat | Windows状态查看 |

**使用方式:**
```bash
# 启动
start.bat

# 查看状态
status.bat

# 停止
stop.bat
```

---

## 🚀 快速开始

### 环境要求

| 组件 | 最低版本 | 推荐版本 |
|------|----------|----------|
| Java | 17 | 21 |
| Node.js | 18 | 20 |
| MySQL | 8.0 | 8.0 |
| Maven | 3.8 | 3.9 |
| Git | 2.30 | 最新 |

### 安装步骤

#### 步骤1: 克隆项目
```bash
git clone https://github.com/XiLi/JZHU-Trading-Suite.git
cd JZHU-Trading-Suite
```

#### 步骤2: 配置数据库
```bash
# 登录MySQL
mysql -u root -p

# 创建数据库
CREATE DATABASE trading CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 退出MySQL
exit

# 初始化表结构
mysql -u root -p trading < jzhu-db-scripts/01_init_kline.sql
```

#### 步骤3: 配置后端
```yaml
# jzhu-market-service/src/main/resources/application.yml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/trading
    username: root
    password: your_password
  data:
    redis:
      host: localhost
      port: 6379
```

#### 步骤4: 启动后端服务
```bash
cd jzhu-market-service
mvn spring-boot:run
```

> 后端服务将在 http://localhost:8080 启动

#### 步骤5: 启动前端
```bash
cd jzhu-web-app

# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

> 前端应用将在 http://localhost:5173 启动

#### 步骤6: 访问系统

打开浏览器访问: **http://localhost:5173**

---

## 📊 API接口文档

### 获取K线数据

```http
GET /api/kline?symbol=BTCUSDT&period=1h&limit=100
```

**参数说明:**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| symbol | string | 是 | 交易对,如 BTCUSDT |
| period | string | 是 | 周期: 1m, 5m, 15m, 1h, 4h, 1d |
| limit | int | 否 | 返回数量,默认100 |

**响应示例:**
```json
{
  "code": 200,
  "message": "success",
  "data": {
    "symbol": "BTCUSDT",
    "period": "1h",
    "list": [
      {
        "time": "2026-01-01 00:00:00",
        "open": "42000.00",
        "high": "42500.00",
        "low": "41800.00",
        "close": "42300.00",
        "volume": "1250.50"
      }
    ]
  }
}
```

### 获取实时行情

```http
GET /api/quote?symbol=BTCUSDT
```

**响应示例:**
```json
{
  "code": 200,
  "message": "success",
  "data": {
    "symbol": "BTCUSDT",
    "price": "42350.50",
    "change24h": "2.35",
    "high24h": "42800.00",
    "low24h": "41500.00",
    "volume24h": "125000000"
  }
}
```

---

## 📁 项目结构

```
JZHU-Trading-Suite/
│
├── 📂 jzhu-market-service/          # 后端API服务 (Spring Boot)
│   ├── src/
│   │   └── main/
│   │       ├── java/                 # Java源代码
│   │       │   └── ai/jzhu/trading/
│   │       │       ├── marketdata/   # 行情数据模块
│   │       │       │   ├── controller/
│   │       │       │   └── MarketDataApplication.java
│   │       │       └── config/       # 配置类
│   │       └── resources/
│   │           └── application.yml   # 应用配置
│   └── pom.xml                        # Maven配置
│
├── 📂 jzhu-trading-common/           # 公共模块
│   ├── src/
│   │   └── main/
│   │       └── java/
│   │           └── ai/jzhu/trading/common/
│   │               └── dto/          # 数据传输对象
│   │                   ├── ErrorResponse.java
│   │                   └── KlineResponse.java
│   └── pom.xml
│
├── 📂 jzhu-strategy-core/            # 策略引擎
│   ├── src/
│   │   └── main/
│   │       └── java/
│   │           └── ai/jzhu/strategy/
│   │               ├── indicator/    # 技术指标
│   │               ├── signal/       # 信号生成
│   │               └── engine/       # 策略引擎
│   └── pom.xml
│
├── 📂 jzhu-web-app/                  # 前端应用 (Vue3)
│   ├── src/
│   │   ├── components/               # 组件
│   │   │   ├── KlineChart.vue       # K线图表
│   │   │   ├── QuoteCard.vue        # 行情卡片
│   │   │   └── Header.vue           # 头部导航
│   │   ├── views/                    # 页面
│   │   │   ├── Home.vue             # 首页
│   │   │   ├── Chart.vue            # 图表页
│   │   │   ├── Trade.vue            # 交易记录
│   │   │   └── Settings.vue         # 设置页
│   │   ├── services/                 # API服务
│   │   │   └── api.js
│   │   ├── stores/                   # 状态管理
│   │   │   └── quote.js
│   │   ├── App.vue
│   │   └── main.js
│   ├── package.json                  # npm配置
│   ├── vite.config.js               # Vite配置
│   └── index.html
│
├── 📂 jzhu-db-scripts/               # 数据库脚本
│   └── 01_init_kline.sql            # K线表初始化
│
├── 📂 jzhu-scripts/                  # 运维脚本
│   ├── start.bat                     # 启动脚本
│   ├── stop.bat                      # 停止脚本
│   └── status.bat                    # 状态脚本
│
└── README.md                          # 项目说明
```

---

## 🛠️ 技术栈

### 后端技术

| 技术 | 版本 | 说明 |
|------|------|------|
| Java | 17+ | 编程语言 |
| Spring Boot | 3.x | Web框架 |
| Maven | 3.8+ | 项目管理 |
| MySQL | 8.0 | 数据库 |
| Redis | 7.x | 缓存(可选) |

### 前端技术

| 技术 | 版本 | 说明 |
|------|------|------|
| Vue | 3.x | 框架 |
| Vite | 5.x | 构建工具 |
| JavaScript | ES6+ | 语言 |
| Axios | 1.x | HTTP客户端 |
| Pinia | 2.x | 状态管理 |

---

## 🤝 贡献指南

欢迎贡献代码!请遵循以下步骤:

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

---

## 📄 许可证

本项目基于 **MIT License** 开源 - 免费商用,欢迎自由使用!

---

## 🙏 致谢

- Spring Boot 团队
- Vue.js 团队
- 所有开源贡献者

---

## 📞 交流

- 🐛 问题反馈: GitHub Issues
- 💡 功能建议: GitHub Issues
- ⭐ 欢迎Star: 点击项目右上角

---

<div align="center">

**让量化交易变得更简单 | Built with ❤️ by JZHU**

</div>
