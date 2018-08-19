def crea_index(parr1, parr2)
  f = File.new('index.html', 'w')
  f.write "<p>#{parr1}</p>"
  f.write "<p>#{parr2}</p>"
  f.close
  nil
end

def actualiza_index(parr1, parr2, arr)
  f = File.open('index.html', 'a')
  f.write "<p>#{parr1}</p>\n"
  f.write "<p>#{parr2}</p>\n"
  unless arr.empty?
    f.write '<ol>'
    arr.sort.map { |e| f.write "<li>#{e}</li>\n" }
    f.write '</ol>'
  end
  f.close
  nil
end

def color_fondo(color)
  f = File.read('index.html')
  fg = f.gsub('<p>', "<p style='background-color:#{color}' >")
  File.write('index.html', fg)
  nil
end

# ejercicio1
crea_index 'Mi parrafo 1', 'Mi parrafo 2'

# ejercicio2
arreglo = []
actualiza_index 'mi parrafo b.1', 'mi parrafo c.1', arreglo

arreglo = [2, 5, 8, 4, 1, 3]
actualiza_index 'mi parrafo b.2', 'mi parrafo c.2', arreglo

# ejercicio3
color_fondo '#0000ff'
