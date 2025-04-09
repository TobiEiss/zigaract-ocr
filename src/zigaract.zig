const std = @import("std");

// Export C functions for library
pub fn main() void {
    std.debug.print("Zigaract OCR library initialized\n", .{});
}

// Create a minimal binding for now
pub const c = @cImport({
    @cInclude("capi.h");
});

// Export a simple wrapper function
pub fn getVersion() []const u8 {
    return std.mem.span(c.TessVersion());
}

test "version" {
    const version = c.TessVersion();
    std.debug.print("Tesseract version: {s}\n", .{version});
    try std.testing.expect(version != null);
}
