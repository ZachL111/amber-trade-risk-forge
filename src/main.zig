const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 176;
const risk_penalty: i32 = 4;
const latency_penalty: i32 = 3;
const weight_bonus: i32 = 2;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 93, .capacity = 101, .latency = 13, .risk = 11, .weight = 8 };
    try std.testing.expectEqual(@as(i32, 220), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "accept"));
    const signal_case_2 = Signal{ .demand = 76, .capacity = 79, .latency = 18, .risk = 21, .weight = 4 };
    try std.testing.expectEqual(@as(i32, 101), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "review"));
    const signal_case_3 = Signal{ .demand = 83, .capacity = 77, .latency = 18, .risk = 5, .weight = 8 };
    try std.testing.expectEqual(@as(i32, 185), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "accept"));
}
