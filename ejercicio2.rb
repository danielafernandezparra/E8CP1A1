
def cuenta_lineas
  file = File.open('peliculas.txt', 'r')
  l = file.readlines.length
  file.close
  l
end

print cuenta_lineas
