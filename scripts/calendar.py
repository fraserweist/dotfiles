import curses
import abc
import dataclasses

DAYS = ["Mon", "Tue", "Wed", "Thu", "Fri"]
HOURS = map(str, range(3, 9))


@dataclasses.dataclass
class Rect:
    x: int
    y: int
    w: int
    h: int


class Renderable(abc.ABC):
    @abc.abstractmethod
    def render(self, screen):
        pass


class Calendar(Renderable):
    def __init__(self, title):
        self.cols = []
        self.title = title
        self.title_height = 5
        self.x_margin = 8
        self.y_margin = 5
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


def draw_border(screen, rect, v_line, h_line, corner):
    # left and right
    for i_y in range(rect.h):
        for i_x in [0, rect.w - 1]:
            screen.addch(rect.y + i_y, rect.x + i_x, v_line)
    # top and bottom
    for i_y in [0, rect.h - 1]:
        for i_x in range(rect.w):
            screen.addch(rect.y + i_y, rect.x + i_x, h_line)
    # corners
    for i_y in [0, rect.h - 1]:
        for i_x in [0, rect.w - 1]:
            screen.addch(rect.y + i_y, rect.x + i_x, corner)


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
                # screen.addch(self.rect.y + i_y, self.rect.x + i_x, '#')


class Axis(Renderable, abc.ABC):
    @abc.abstractmethod
    def draw_units(self):
        pass

    def render(self, screen):
        draw_border(screen, self.rect, '|', '-', '+')
        self.draw_units()


class XAxis(Axis):
    def __init__(self, title_height, x_margin, y_margin, units):
        self.rect = Rect(
            x_margin - 1,
            title_height,
            curses.COLS - x_margin + 1,
            y_margin
        )
        self.units = units

    def draw_units(self):
        pass


class YAxis(Axis):
    def __init__(self, title_height, x_margin, y_margin, units):
        self.rect = Rect(
            0,
            title_height + y_margin - 1,
            x_margin,
            curses.LINES - (title_height + y_margin) + 1
        )
        self.units = units

    def draw_units(self):
        pass


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
