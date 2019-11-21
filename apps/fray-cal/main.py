import curses
import logging

from fray_cal.calendar import Calendar
from fray_cal.controller import Controller


LOGGER = logging.getLogger(__file__)
handler = logging.FileHandler(__file__ + ".log")
formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
handler.setFormatter(formatter)
LOGGER.addHandler(handler)
LOGGER.setLevel(logging.DEBUG)


def main(scr):
    scr.clear()
    cal = Calendar("Fray's Calendar")
    controller = Controller(cal)
    cal.render(scr)
    scr.refresh()

    while controller.poll_event(scr):
        cal.render(scr)
        scr.refresh()


if __name__ == "__main__":
    curses.wrapper(main)
