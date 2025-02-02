return {
    'rcarriga/nvim-notify',
    opts =  {
        baczkground_colour = "NotifyBackground",
        fps = 120,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        level = 2,
        minimum_width = 50,
        render = "compact",
        stages = "fade",
        time_formats = {
          notification = "%T",
          notification_history = "%FT%T"
        },
        timeout = 300,
        top_down = true
    }
}
