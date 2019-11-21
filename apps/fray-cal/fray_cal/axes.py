import abc
import curses

from .draw_tools import draw_rect, draw_horizontal_units, draw_vertical_units
from .base import Renderable, Rect


class Axis(Renderable, abc.ABC):
    @abc.abstractmethod
    def draw_units(self, screen):
        pass

    def render(self, screen):
        draw_rect(screen, self.rect, '|', '-', '+')
        self.draw_units(screen)


class XAxis(Axis):
    def __init__(self, title_height, x_margin, y_margin, units):
        self._rect = Rect(
            x_margin - 1,
            title_height,
            ((curses.COLS - x_margin + 1) // len(units)) * len(units) + 1,
            y_margin
        )
        self.units = units

    def draw_units(self, screen):
        draw_vertical_units(screen, self.rect, self.units, '|', '+')


class YAxis(Axis):
    def __init__(self, title_height, x_margin, y_margin, units):
        self._rect = Rect(
            0,
            title_height + y_margin - 1,
            x_margin,
            ((curses.LINES - (title_height + y_margin) + 1)
                // len(units)) * len(units)
        )
        self.units = units

    def draw_units(self, screen):
        draw_horizontal_units(screen, self.rect, self.units, '-', '+')

