import curses


class Controller():
    def __init__(self, calendar):
        self.calendar = calendar
        curses.mousemask(curses.BUTTON1_CLICKED)

    def poll_event(self, screen):
        event = screen.getch()
        if event == ord('q'):
            return False
        elif event == curses.KEY_LEFT:
            return False
        elif event == curses.KEY_MOUSE:
            self.calendar.click()

        return True
