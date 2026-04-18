# JZHU Market Service

Spring Boot 行情数据服务 - 专业的金融数据API

## 简介

JZHU Market Service 是基于 Spring Boot 开发的行情数据服务，提供K线数据查询、实时行情等金融数据API。

## 核心功能

- **K线数据查询** - 支持日线、分钟线等多种周期
- **实时行情** - 获取实时交易数据
- **数据缓存** - 高效的数据缓存机制
- **RESTful API** - 标准化的Web API接口

## 技术栈

- Java 17
- Spring Boot 3.x
- Maven
- MySQL

## 快速开始

### 编译
```bash
mvn clean package
```

### 运行
```bash
java -jar target/market-data-service-1.0.0-SNAPSHOT.jar
```

或:
```bash
mvn spring-boot:run
```

## API接口

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | /api/kline | 获取K线数据 |
| GET | /api/quote | 获取实时行情 |
| GET | /health | 健康检查 |

## 配置

在 application.yml 中配置数据库连接

## 许可证

MIT License