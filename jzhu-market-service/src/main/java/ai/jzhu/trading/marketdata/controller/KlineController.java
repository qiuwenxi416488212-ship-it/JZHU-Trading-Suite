package ai.jzhu.trading.marketdata.controller;

import ai.jzhu.trading.common.dto.KlineResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/kline")
public class KlineController {

    @GetMapping("/{symbol}")
    public List<KlineResponse> getKline(@PathVariable String symbol,
                                        @RequestParam(defaultValue = "daily") String period) {
        // TODO: 从数据库查询K线数据
        return List.of(
            new KlineResponse("2026-04-15", 100.0, 105.0, 99.0, 103.0, 1000000L),
            new KlineResponse("2026-04-16", 103.0, 108.0, 102.0, 106.0, 1200000L)
        );
    }
}
