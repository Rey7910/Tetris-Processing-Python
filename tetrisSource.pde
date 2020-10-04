import random

square_width = 43
colors = [[128, 128, 128], [160, 160, 160], [88, 238, 249], [102, 0, 204], [0, 0, 255], [204, 102, 0], [255, 0, 0],[0, 255, 0], [255, 255, 0]]


def get_possible_positions(shape_type, y_position, x_position):
    """
    Sends the possible relative positions for each tetris tile.

    :param shape_type: The shape which needs the positions
    :param y_position: Current y position of the tile
    :param x_position:Current x position of the tile
    :return:
    """
    possible_positions_list = [
        [[
            [[y_position, x_position],
             [y_position, x_position - 1],
             [y_position, x_position - 2],
             [y_position, x_position - 3]],

            [[y_position, x_position],
             [y_position + 1, x_position],
             [y_position + 2, x_position],
             [y_position + 3, x_position]],

            [[y_position, x_position],
             [y_position, x_position + 1],
             [y_position, x_position + 2],
             [y_position, x_position + 3]],

            [[y_position, x_position],
             [y_position - 1, x_position],
             [y_position - 2, x_position],
             [y_position - 3, x_position]],
        ]],
        [[
            [[y_position, x_position],
             [y_position - 1, x_position + 1],
             [y_position - 1, x_position],
             [y_position - 1, x_position - 1]],

            [[y_position, x_position],
             [y_position - 1, x_position - 1],
             [y_position, x_position - 1],
             [y_position + 1, x_position - 1]],

            [[y_position, x_position],
             [y_position + 1, x_position - 1],
             [y_position + 1, x_position],
             [y_position + 1, x_position + 1]],

            [[y_position, x_position],
             [y_position + 1, x_position + 1],
             [y_position, x_position + 1],
             [y_position - 1, x_position + 1]],
        ]],
        [[
            [[y_position, x_position],
             [y_position, x_position - 1],
             [y_position, x_position - 2],
             [y_position - 1, x_position - 2]],

            [[y_position, x_position],
             [y_position - 1, x_position],
             [y_position - 2, x_position],
             [y_position - 2, x_position + 1]],

            [[y_position, x_position],
             [y_position, x_position + 1],
             [y_position, x_position + 2],
             [y_position + 1, x_position + 2]],

            [[y_position, x_position],
             [y_position + 1, x_position],
             [y_position + 2, x_position],
             [y_position + 2, x_position - 1]],
        ]],
        [[
            [[y_position, x_position],
             [y_position + 1, x_position],
             [y_position + 1, x_position - 1],
             [y_position + 1, x_position - 2]],

            [[y_position, x_position],
             [y_position, x_position - 1],
             [y_position - 1, x_position - 1],
             [y_position - 2, x_position - 1]],

            [[y_position, x_position],
             [y_position - 1, x_position],
             [y_position - 1, x_position + 1],
             [y_position - 1, x_position + 2]],

            [[y_position, x_position],
             [y_position, x_position + 1],
             [y_position + 1, x_position + 1],
             [y_position + 2, x_position + 1]],
        ]],
        [[
            [[y_position, x_position],
             [y_position, x_position + 1],
             [y_position + 1, x_position + 1],
             [y_position + 1, x_position + 2]],

            [[y_position, x_position],
             [y_position + 1, x_position],
             [y_position + 1, x_position - 1],
             [y_position + 2, x_position - 1]],

            [[y_position, x_position],
             [y_position, x_position - 1],
             [y_position - 1, x_position - 1],
             [y_position - 1, x_position - 2]],

            [[y_position, x_position],
             [y_position - 1, x_position],
             [y_position - 1, x_position + 1],
             [y_position - 2, x_position + 1]],
        ]],
        [[
            [[y_position, x_position],
             [y_position, x_position + 1],
             [y_position - 1, x_position + 1],
             [y_position - 1, x_position + 2]],

            [[y_position, x_position],
             [y_position + 1, x_position],
             [y_position + 1, x_position + 1],
             [y_position + 2, x_position + 1]],

            [[y_position, x_position],
             [y_position, x_position - 1],
             [y_position + 1, x_position - 1],
             [y_position + 1, x_position - 2]],

            [[y_position, x_position],
             [y_position - 1, x_position],
             [y_position - 1, x_position - 1],
             [y_position - 2, x_position - 1]],
        ]],
        [[
            [[y_position, x_position],
             [y_position, x_position + 1],
             [y_position + 1, x_position],
             [y_position + 1, x_position + 1]],

            [[y_position, x_position],
             [y_position, x_position + 1],
             [y_position + 1, x_position],
             [y_position + 1, x_position + 1]],

            [[y_position, x_position],
             [y_position, x_position + 1],
             [y_position + 1, x_position],
             [y_position + 1, x_position + 1]],

            [[y_position, x_position],
             [y_position, x_position + 1],
             [y_position + 1, x_position],
             [y_position + 1, x_position + 1]],
        ]]
    ]
    return possible_positions_list[shape_type - 2]


class Board(object):
    """The board is represented in a 2d dynamic array, where positions with 0 represent a blank space"""

    def __init__(self):
        self.matrix_positions = [[0 for x in range(12)] for y in range(22)]  # Represents each of the board positions
        self.on_game = True

    def display(self):
        """Finish the constructor. Must be done this way because Processing does not allow large constructors"""
        for i in range(12):
            for j in range(22):
                fill(128, 128, 128)  # Gray
                square(i * square_width, j * square_width, square_width)
        fill(0, 0, 0)
        for i in range(12):
            self.matrix_positions[0][i] = 3
            self.matrix_positions[21][i] = 3
            square(i * square_width, 0, square_width)
            square(i * square_width, 21 * square_width, square_width)
        for i in range(22):
            self.matrix_positions[i][0] = 3
            self.matrix_positions[i][11] = 3
            square(0, i * square_width, square_width)
            square(11 * square_width, i * square_width, square_width)

    def is_available_slot(self, y, x):
        """Check if a slot with given (y,x) coordinates has a zero value"""
        if y < 0 or x < 0 or x > 11:
            return False
        return self.matrix_positions[y][x] == 1 or self.matrix_positions[y][x] == 0

    def fill_slot_movement(self, y, x, shape_type):
        """Fills the occupied spaces by the moving tile with temporal 1's in the board(2d array)"""
        r, g, b = colors[shape_type]
        if (not (y < 0 or x < 0)) and self.is_available_slot(y, x):
            self.matrix_positions[y][x] = 1
            fill(r, g, b)
            square(x * square_width, y * square_width, square_width)

    def fill_slot_static(self, positions, shape):
        """
        Fills the 2d matrix spaces with each shape unique value. This happens when the tile can't move
        down any longer

        :param positions: The final positions of each tile square
        :param shape: The type of shape
        :return: None
        """
        r, g, b = colors[shape]
        for coordinate in positions:
            y, x = coordinate
            self.matrix_positions[y][x] = shape
            fill(r, g, b)
            square(x * square_width, y * square_width, square_width)

    def remove_slot(self, y, x):
        """Makes zero a given slot with given (y,x) coordinates"""
        if y < 0 or x < 0:  # Out of bounds
            return
        elif self.matrix_positions[y][x] != 3:
            self.matrix_positions[y][x] = 0
            fill(128, 128, 128)
            square(x * square_width, y * square_width, square_width)

    def check_full_line(self):
        """Checks if a line is full, so it can remove it"""
        global score, level
        if self.matrix_positions[1].count(0) != 10:  # You lose
            self.on_game = False
            return
        for i in range(1, 21):
            if 0 not in self.matrix_positions[i]:
                self.remove_full_line(i)
                score += 1
                level += 0.05

    def remove_full_line(self, full_line_index):
        """Removes a full line. Index of the full line must be passed"""
        for i in range(full_line_index, 2, -1):
            for j in range(1, 11):
                self.matrix_positions[i][j] = self.matrix_positions[i - 1][j]
                r, g, b = colors[self.matrix_positions[i - 1][j]]
                fill(r, g, b)
                square(j * square_width, i * square_width, square_width)


class Tetromino:
    """
    Represents a tetris tile. Tetris tiles have common methods:  i.e moving down, moving to laterals, rotating.
    The only difference between tiles is the relative positions of each os its squares. Relatives positions are
    obtanied with the get_possible_positions() function and passed here to the constructor.
    Each tetris shape has 4 squares (or positions) wich are then represented in an object of class Board. The object is
    modified by each Tetromino object.
    """

    def __init__(self, figure_type):
        self.static_x = 7
        self.static_y = 1
        self.shape_type = figure_type
        self.currentRotation = 0
        self.active = True

    def updatePositions(self):
        """Updates positions in the Board object each time the tile performs a movement"""
        self.possiblePositions = get_possible_positions(self.shape_type, self.static_y, self.static_x)
        self.currentPositions = self.possiblePositions[0][self.currentRotation]
        for coordinate in self.currentPositions:
            y, x = coordinate
            game_board.fill_slot_movement(y, x, self.shape_type)

    def moveDown(self):
        """
        Move the tile down whenever possible"

        :return: False when it can't go down anymore. True otherwise.
        """
        if not self.active:
            return
        for coordinate in self.currentPositions:
            y, x = coordinate
            if not game_board.is_available_slot(y + 1, x):
                game_board.fill_slot_static(self.currentPositions, self.shape_type)
                game_board.check_full_line()
                self.active = False
                return False
        for coordinate in self.currentPositions:
            y, x = coordinate
            game_board.remove_slot(y, x)
        self.static_y += 1
        self.updatePositions()
        return True

    def moveLateral(self, direction):
        """
        Moves the tile to laterals whenever possible. It is prevented to go out of bounds.

        :param direction: The direction to move: 0 for moving left and 1 for going rigth
        """
        for coordinate in self.currentPositions:
            y, x = coordinate
            if (direction == 0 and not game_board.is_available_slot(y, x - 1)) or (
                    direction == 1 and not game_board.is_available_slot(y, x + 1)):
                return
        for coordinate in self.currentPositions:
            y, x = coordinate
            game_board.remove_slot(y, x)
        if direction == 0:
            self.static_x -= 1
        elif direction == 1:
            self.static_x += 1
        self.updatePositions()

    def rotate(self):
        """Rotates the tile to left on its own axis. Any illegal move is not performed and the next legal move
         is done then."""
        for coordinate in self.currentPositions:
            y, x = coordinate
            game_board.remove_slot(y, x)

        self.currentRotation = (self.currentRotation + 1) % 4
        nextRotation = self.possiblePositions[0][self.currentRotation]

        while True:
            for coordinate in nextRotation:
                y, x = coordinate
                if not game_board.is_available_slot(y, x):  # If the operation is illegal the next legal move is done
                    self.currentRotation = (self.currentRotation + 1) % 4
                    nextRotation = self.possiblePositions[0][self.currentRotation]
                    break
            else:
                self.updatePositions()
                return


def print_lost_message(final_score):
    """Message with the final score of the game"""
    fill(0, 0, 0)
    rect(0, 0, 516, 946)
    textSize(50)
    fill(255, 255, 255)
    text('Has perdido :(', 80, 200)
    textSize(40)
    fill(255, 255, 255)
    text('Puntaje final:', 0, 400)
    fill(255, 0, 0)
    textSize(90)
    text('{} puntos'.format(final_score), 0, 500)


def show_score(current_score):
    """Shows the current number of removed lines(score) in the right side of the screen"""
    fill(0, 0, 0)
    rect(517, 0, 299, 946)
    textSize(40)
    fill(255, 0, 0)
    text('Puntaje \n actual', 597, 200)
    fill(0, 255, 0)
    textSize(50)
    text(current_score, 587, 400)


def draw_next_image():
    """Shows the next tile that will be on game"""
    shape_code = randomList[currentListFigure + 2]
    fill(0, 0, 0)
    square(527, 473, 280)
    r, g, b = colors[shape_code]
    fill(r, g, b)
    stroke(255, 255, 255)

    if shape_code == 2:
        for i in range(4):  square(527 + (i * 70), 566, 70)
    elif shape_code == 3:
        for i in range(3):  square(540 + (i * 70), 566, 70)
        square(610, 636, 70)
    elif shape_code == 4:
        square(527, 636, 70)
        for i in range(3):  square(527 + (i * 70), 706, 70)
    elif shape_code == 5:
        square(667, 636, 70)
        for i in range(3):  square(527 + (i * 70), 706, 70)
    elif shape_code == 6:
        for i in range(2): square(527 + (i * 70), 636, 70)
        for i in range(2): square(597 + (i * 70), 706, 70)
    elif shape_code == 7:
        for i in range(2): square(527 + (i * 70), 706, 70)
        for i in range(2): square(597 + (i * 70), 636, 70)
    elif shape_code == 8:
        for i in range(2): square(527 + (i * 70), 636, 70)
        for i in range(2): square(527 + (i * 70), 706, 70)
    stroke(0, 0, 0)


randomList = []
for i in range(800):
    randomList.append(random.randint(2, 8))
currentListFigure = 0


def getRandomFigure():
    """Generates a figure depending on the current value of randomList"""
    global currentListFigure
    currentListFigure += 1
    return Tetromino(randomList[currentListFigure])


def setup():
    size(816, 946)
    show_score(0)
    game_board.display()
    figure_object.updatePositions()


tiempo = 0  # For delay purposes
playing = True  # Tells the state of the game. By dafault the game is active.
score = 0  # Total number of removed lines
level = 1  # Current speed of the tiles. Higher is faster and harder.
game_board = Board()
figure_object = Tetromino(2)


def draw():
    global figure_object, tiempo, game_board, playing

    if keyPressed:
        if key == 'w' or key == 'W':
            figure_object.rotate()
            delay(120)
        elif key == 'a' or key == 'A':
            figure_object.moveLateral(0)  # Move left
            delay(120)
        elif key == 'd' or key == 'D':
            figure_object.moveLateral(1)  # Move right
            delay(120)
        elif key == 's' or key == 'S':
            while figure_object.moveDown():
                delay(15)

    delay(1)
    tiempo += 1
    if playing and tiempo == 20 // level:  # Delay time. If level increases the delay is reduced.
        if not figure_object.moveDown():
            show_score(score)
            if game_board.on_game:
                draw_next_image()
                figure_object = getRandomFigure()
                figure_object.updatePositions()
            else:  # You lose
                print_lost_message(score)
                playing = False
        tiempo = 0

