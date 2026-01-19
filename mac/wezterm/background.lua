local background_image = "/Users/shio3ch/Pictures/oberon.jpg"

return {
  {
    source = {
      Gradient = {
      colors = {
          "#777777",
          "#222222"
        },
      orientation = {
          Linear = { angle = -30.0 },
        },
      },
    },
    opacity = 1.0,
    width = "100%",
    height = "100%",
  },
  {
    source = {
        File = background_image,
    },
    opacity = 0.33,
    vertical_align = "Middle",
    horizontal_align = "Center",
    horizontal_offset = "200px",
    repeat_x = "NoRepeat",
    repeat_y = "NoRepeat",
    --width = "1431px",
    --height = "1900px",
  },
}
