minetest.register_on_joinplayer(function(player)

    -- Add the initial HUD element
    local hud_id = player:hud_add({
        hud_elem_type = "image",
        position = {x = 0, y = 1},
        offset = {x = 0, y = 0},
        text = "blockalot.png",
        scale = {x = 0.2, y = 0.2},
        alignment = {x = 1, y = -1},
    })

    minetest.after(5, function()
        -- Gradually move the image off the screen
        local fade_steps = 250
        for i = 1, fade_steps do
            minetest.after(i * 0.01, function()
                if player then
                    local x_value = (-(i * 2))
                    local new_offset = {x=x_value, y=0}
                    player:hud_change(hud_id, "offset", new_offset)

                    -- Remove HUD when fully off screen
                    if x_value <= -500 then
                        player:hud_remove(hud_id)
                    end
                end
            end)
        end
    end)
end)