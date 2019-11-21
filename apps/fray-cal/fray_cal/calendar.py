import curses
from .base import Renderable, Rect, Clickable
from .axes import XAxis, YAxis


DAYS = ["Mon", "Tue", "Wed", "Thu", "Fri"]
HOURS = [f"{x}pm" for x in range(3, 9)]


class Calendar(Renderable):
    def __init__(self, title):
        self.cols = []
        self.title = title
        self.title_height = 3
        self.x_margin = 9
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

    def click(self):
        _, mx, my, _, _ = curses.getmouse()
        for col in self.cols:
            if (mx, my) in col:
                col.click()
            else:
                col.unclick()



class CalendarColumn(Renderable):
    def __init__(self, rect, day):
        self._rect = rect
        self.blocks = []

    def select(self):
        self.selected = True

    def deselect(self):
        self.selected = False

    def render(self, screen):
        for block in self.blocks:
            block.render(screen)

    def click(self):
        _, mx, my, _, _ = curses.getmouse()
        for block in self.blocks:
            if (mx, my) in block:
                block.click()
            else:
                block.unclick()

    def unclick(self):
        for block in self.blocks:
            block.unclick()


class CalendarBlock(Renderable, Clickable):
    pass
