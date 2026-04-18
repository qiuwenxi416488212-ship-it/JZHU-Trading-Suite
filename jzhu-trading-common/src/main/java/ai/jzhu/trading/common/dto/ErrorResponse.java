package ai.jzhu.trading.common.dto;

public record ErrorResponse(
    int status,
    String message,
    String timestamp
) {}
