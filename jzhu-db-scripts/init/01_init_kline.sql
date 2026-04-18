-- 启用 TimescaleDB 扩展
CREATE EXTENSION IF NOT EXISTS timescaledb;

-- 设置时区
SET timezone = 'America/New_York';

-- 日K线表
CREATE TABLE IF NOT EXISTS kline_daily (
    time TIMESTAMPTZ NOT NULL,
    symbol VARCHAR(20) NOT NULL,
    market VARCHAR(10) NOT NULL,
    open DOUBLE PRECISION,
    high DOUBLE PRECISION,
    low DOUBLE PRECISION,
    close DOUBLE PRECISION,
    volume BIGINT
);

-- 转换为 TimescaleDB 超表
SELECT create_hypertable('kline_daily', 'time', if_not_exists => TRUE);

-- 唯一索引
CREATE UNIQUE INDEX IF NOT EXISTS idx_kline_daily_symbol_time
ON kline_daily (symbol, market, time DESC);

-- 周K线表
CREATE TABLE IF NOT EXISTS kline_weekly (LIKE kline_daily INCLUDING ALL);
SELECT create_hypertable('kline_weekly', 'time', if_not_exists => TRUE);

-- 月K线表
CREATE TABLE IF NOT EXISTS kline_monthly (LIKE kline_daily INCLUDING ALL);
SELECT create_hypertable('kline_monthly', 'time', if_not_exists => TRUE);
