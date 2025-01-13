return {
    "rachartier/tiny-glimmer.nvim",
    event = "TextYankPost",
    config = function()
        require('tiny-glimmer').setup({
            enabled = true,
            default_animation = "fade",
            animations = {
                fade = {
                    from_color = "#D27E99",
                    max_duration = 250,
                    chars_for_max_duration = 10,
                },
                bounce = {
                    from_color = "#D27E99",
                    max_duration = 500,
                    chars_for_max_duration = 20,
                    oscillation_count = 1,
                },
                left_to_right = {
                    from_color = "#D27E99",
                    to_color = "#D27E99",
                    max_duration = 350,
                    chars_for_max_duration = 40,
                    lingering_time = 50,
                },
                pulse = {
                    from_color = "#D27E99",
                    max_duration = 400,
                    chars_for_max_duration = 15,
                    pulse_count = 2,
                    intensity = 1.2,
                },
                rainbow = {
                    max_duration = 600,
                    chars_for_max_duration = 20,
                },
            }
        })
    end
}
