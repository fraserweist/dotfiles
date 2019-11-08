import curses
import abc
import dataclasses
import enum

DAYS = ["Mon", "Tue", "Wed", "Thu", "Fri"]
HOURS = [f"{x}pm" for x in range(3, 9)]


@dataclasses.dataclass
class Rect:
    x: int
    y: int
    w: int
    h: int


class Dir(enum.Enum):
    HORIZONTAL = 1
    VERTICAL = 2


class Renderable(abc.ABC):
    @abc.abstractmethod
    def render(self, screen):
        pass


class Calendar(Renderable):
    def __init__(self, title):
        self.cols = []
        self.title = title
        self.title_height = 3
        self.x_margin = 5
        self.y_margin = 3
        for i in range(len(DAYS)):
            w = (curses.COLS - self.x_margin) // len(DAYS)
            h = curses.LINES - (self.title_height + self.y_margin)
            x = self.x_margin + i * w
            y = self.title_height + self.y_margin
            col_rect = Rect(x, y, w, h)
            self.cols.append(CalendarColumn(col_rect, DAYS[i]))
        self.axes = [
            XAxis(self.title_height, self.x_margin, self.y_margin, DAYS),
            YAxis(self.title_height, self.x_margin, self.y_margin, HOURS)
        ]

    def render(self, screen):
        # render title
        x = (curses.COLS - len(self.title)) // 2
        y = self.title_height // 2
        screen.addstr(y, x, self.title)

        # render sub-objects
        for col in self.cols:
            col.render(screen)
        for axis in self.axes:
            axis.render(screen)


class CalendarColumn(Renderable):

    def __init__(self, rect, day):
        self.rect = rect

    def select(self):
        self.selected = True

    def deselect(self):
        self.selected = False

    def render(self, screen):
        # TODO selected border
        for i_y in range(self.rect.h):
            for i_x in range(self.rect.w):
                pass


def draw_grid(screen, rect, units, direction, v_line, h_line, corner):
    if direction == Dir.HORIZONTAL:
        x_units = units
        y_units = 1
        horizontal = True
    else:
        x_units = 1
        y_units = units
        horizontal = False
    width = (rect.w // x_units) * x_units
    height = (rect.h // y_units) * y_units
    # vertical lines
    for i_y in range(height):
        for i_x in list(range(0, rect.w + horizontal, rect.w // x_units)):
            screen.addch(rect.y + i_y, rect.x + i_x, v_line)
    # horizontal lines
    for i_y in list(range(0, rect.h + (not horizontal), rect.h // y_units)):
        for i_x in range(width):
            screen.addch(rect.y + i_y, rect.x + i_x, h_line)
    # corners
    for i_y in list(range(0, rect.h + (not horizontal), rect.h // y_units)):
        for i_x in list(range(0, rect.w + horizontal, rect.w // x_units)):
            screen.addch(rect.y + i_y, rect.x + i_x, corner)


class Axis(Renderable, abc.ABC):
    def draw_units(self, screen):
        if self.dir == Dir.HORIZONTAL:
            center_y = self.rect.y + self.rect.h // 2
            for i in range(len(self.units)):
                x = int(
                    self.rect.x + (self.rect.w // len(self.units)) *
                    (0.5 + i)
                )
                screen.addstr(
                    center_y,
                    x - len(self.units[i]) // 2,
                    self.units[i]
                )
        else:
            center_x = self.rect.x + self.rect.w // 2
            for i in range(len(self.units)):
                y = int(
                    self.rect.y + (self.rect.h // len(self.units)) *
                    (0.5 + i)
                )
                screen.addstr(
                    y,
                    center_x - len(self.units[i]) // 2,
                    self.units[i]
                )

    def render(self, screen):
        draw_grid(screen, self.rect, len(self.units), self.dir, '|', '-', '+')
        self.draw_units(screen)


class XAxis(Axis):
    def __init__(self, title_height, x_margin, y_margin, units):
        self.rect = Rect(
            x_margin - 1,
            title_height,
            ((curses.COLS - x_margin + 1) // len(units)) * len(units),
            y_margin
        )
        self.dir = Dir.HORIZONTAL
        self.units = units


class YAxis(Axis):
    def __init__(self, title_height, x_margin, y_margin, units):
        self.rect = Rect(
            0,
            title_height + y_margin - 1,
            x_margin,
            ((curses.LINES - (title_height + y_margin) + 1)
                // len(units)) * len(units)
        )
        self.dir = Dir.VERTICAL
        self.units = units


def main(scr):
    scr.clear()
    cal = Calendar("Fray's Calendar")

    while True:
        cal.render(scr)
        scr.refresh()
        key = scr.getch()
        if key == ord('q'):
            break
        if key == curses.KEY_LEFT:
            break


if __name__ == "__main__":
    curses.wrapper(main)
