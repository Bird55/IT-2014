board_size = 9

getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

makeSourceMap = (size) ->
  last_index = size*3-1

  # init empty source array
  map = []
  for row in [0..last_index]
    row = []
    for col in [0..last_index]
      row.push 0
    map.push row

  # protect walls
  for idx in [0..last_index]
    map[0][idx] = -1
    map[last_index][idx] = -1
    map[idx][0] = -1
    map[idx][last_index] = -1

  # place server
  server = {
    row: getRandomInt(1, size - 2)
    col: getRandomInt(1, size - 2)
  }

  for shift_row in [-1..1]
    for shift_col in [-1..1]
      map[server.row*3+1+shift_row][server.col*3+1+shift_col] = -1

  map[server.row*3+1][server.col*3+1] = -2

  dir = getRandomInt(0, 3)

  shift_row = 0
  shift_col =0
  if dir == 1
    shift_row = 1
  else if dir == 2
    shift_row = -1
  else if dir == 3
    shift_col = 1
  else
    shift_col = -1

  map[server.row*3+1+shift_row][server.col*3+1+shift_col] = 1

  # protect corners
  for row in [0..size-1]
    for col in [0..size-1]
      map[row*3][col*3] = -1
      map[row*3][col*3+2] = -1
      map[row*3+2][col*3] = -1
      map[row*3+2][col*3+2] = -1


  map

renderSourceMap = (map) ->
  $map = $('#map').empty()
  for row in map
    for cell in row
      $map.append $('<div>').addClass("d-#{cell}")
$ ->
  renderSourceMap makeSourceMap(5)