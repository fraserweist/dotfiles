import abc
import dataclasses


@dataclasses.dataclass
class Rect:
    x: int
    y: int
    w: int
    h: int


class Renderable(abc.ABC):
    @property
    def rect(self):
        return self._rect

    def __contains__(self, coords):
        x, y = coords
        return (
            x >= self.rect.x and x < self.rect.x + self.rect.w and
            y >= self.rect.y and y < self.rect.y + self.rect.h
        )

    @abc.abstractmethod
    def render(self, screen):
        pass


class Clickable(abc.ABC):
    @abc.abstractmethod
    def click(self):
        pass
