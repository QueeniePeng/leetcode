const maze = [[1, 0, 0, 1, 1], [1, 1, 0, 1, 1], [1, 0, 0, 1, 1], [1, 0, 1, 1, 0], [1, 0, 0, 0, 0]];



const solution = (maze, startRow, startCol, destRow, destCol) => {
  if (!maze || maze.length === 0) { return false; }
  
  var x = startCol;
  var y = startRow;
  nextZero(maze, y, x);

  function nextZero(maze, yLevel, xLevel) {
      maze[y][x] = -1;
      if (x !== destCol || y !== destRow) {
          if (isDownZero(maze, y, x)) {
              y += 1;
              nextZero(maze, y, x);
          }
          if (isRightZero(maze, y, x)) {
              x += 1;
              nextZero(maze, y, x);
          }
          if (isUpZero(maze, y, x)) {
              y -= 1;
              nextZero(maze, y, x);
          }
      }
  }
  
  function isDownZero(maze, y, x) {
      if (y < maze.length - 1) {
          return maze[y+1][x] === 0;
      }
      return false;
  }
  
  function isRightZero(maze, y, x) {
      if (x < maze[y].length - 1) {
          return maze[y][x+1] === 0;
      }
      return false;
  }

  function isUpZero(maze, y, x) {
      if (y > 0) {
          return maze[y-1][x] === 0;
      }
      return false;
  }

  function isLeftZero(maze, y, x) {
      if (x > 0) {
          return maze[y][x-1] === 0;
      }
      return false;
  }
  console.log(maze);
  return x === destCol && y === destRow;
};



solution(maze, 0, 1, 3, 4);
