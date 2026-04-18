# JZHU DB Scripts

数据库初始化脚本

## 简介

包含交易系统数据库初始化SQL脚本，用于创建数据库表结构和基础数据。

## 包含

- K线数据表初始化 (01_init_kline.sql)

## 使用

```bash
mysql -u root -p trading < 01_init_kline.sql
```

## 许可证

MIT License