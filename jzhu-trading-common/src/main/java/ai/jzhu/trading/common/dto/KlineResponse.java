package ai.jzhu.trading.common.dto;

public record KlineResponse(
    String date,
    double open,
    double high,
    double low,
    double close,
    long volume
) {}
