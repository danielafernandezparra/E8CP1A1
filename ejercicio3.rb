  file = File.open('peliculas.txt', 'r')
  t = 0
  print file.readlines.inject(t){ |t, e| t += e.split(" ").size }
  file.close
