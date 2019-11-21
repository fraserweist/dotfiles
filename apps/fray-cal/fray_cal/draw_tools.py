def draw_rect(screen, rect, v_line, h_line, corner, label = None):
    # top and bottom
    for i_x in range(rect.x, rect.x + rect.w):
        screen.addch(rect.y, i_x, h_line)
        screen.addch(rect.y + rect.h - 1, i_x, h_line)
    # left and right
    for i_y in range(rect.y, rect.y + rect.h):
        screen.addch(i_y, rect.x, v_line)
        screen.addch(i_y, rect.x + rect.w - 1, v_line)
    # corners
    screen.addch(rect.y, rect.x, corner)
    screen.addch(rect.y + rect.h - 1, rect.x, corner)
    screen.addch(rect.y, rect.x + rect.w - 1, corner)
    screen.addch(rect.y + rect.h - 1, rect.x + rect.w - 1, corner)
    if label:
        screen.addstr(rect.y + rect.h // 2, rect.x + rect.w // 2 - len(label) // 2, label)


def draw_vertical_units(screen, rect, units, v_line, corner):
    unit_count = len(units)
    unit_width = (rect.w // unit_count)
    for i_unit in range(1, unit_count):
        for i_y in range(rect.y, rect.y + rect.h):
            # draw line
            screen.addch(i_y, rect.x + unit_width * i_unit, v_line)
        screen.addch(rect.y, rect.x + unit_width * i_unit, corner)
        screen.addch(rect.y + rect.h - 1, rect.x + unit_width * i_unit, corner)
    for i_unit in range(unit_count):
        screen.addstr(
            rect.y + rect.h // 2,
            rect.x + unit_width * i_unit + unit_width // 2,
            units[i_unit]
        )


def draw_horizontal_units(screen, rect, units, h_line, corner):
    unit_count = len(units)
    unit_height = (rect.h // unit_count)
    for i_unit in range(1, unit_count):
        for i_x in range(rect.x, rect.x + rect.w):
            # draw line
            screen.addch(rect.y + unit_height * i_unit, i_x, h_line)
        screen.addch(rect.y + unit_height * i_unit, rect.x, corner)
        screen.addch(rect.y + unit_height * i_unit, rect.x + rect.w - 1, corner)
    for i_unit in range(unit_count):
        screen.addstr(
            rect.y + unit_height * i_unit + unit_height // 2,
            rect.x + rect.w // 2 - len(units[i_unit]) // 2,
            units[i_unit]
        )
