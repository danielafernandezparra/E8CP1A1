opcion = 0
sub_opcion = 0

txt_menu = <<MENU
Seleccionar una opción
1. Ver cantidad de productos existentes
2. Ver Stock Total de algún producto determinado
3. Ver productos no registrados en cada bodega
4. producto con existencia maxima asignada
5. Ingresar nuevo producto
6. Salir
MENU

txt_menu2 = <<MENU2
  a. Mostrar la existencia por productos.
  b. Mostrar la existencia total por tienda.
  c. Mostrar la existencia total en todas las tiendas.
  d. Volver al menú principal.
MENU2

def opcion_1
  def opcion_a
    file = File.open('productos.txt', 'r')
    bodega = file.readlines.map { |e| e.chomp.split(', ') }
    file.close
    print bodega
  end

  def opcion_c
    file = File.open('productos.txt', 'r')
    bodega = file.readlines.map { |e| "#{e.chomp.split(', ')[0]}: #{e.chomp.split(', ').inject(0) { |i, valor| i + valor.to_i }}" }
    file.close
    puts bodega
  end
end

def opcion_3
  print "Ver productos no registrados en cada bodega\n"
  bodega = File.read('productos.txt')
  bodega.split("\n").map do |producto|
    producto = producto.split('\ ')
    name_pro = [0]
    no_registro = producto.select { |x| x == 'NR'}
    print "#{name_pro}, cantidad no registrada: #{no_registro.count}\n"
  end
  puts
end

def opcion_5
  print "Ingrese nuevo producto"
  bodega = File.open('productos.txt', 'a')
  File.close
end

end
while opcion != 6
  print txt_menu
  opcion = gets.to_i
  case opcion
  when 1
      while sub_opcion != 'd'
        print "Productos existentes\n"
        print txt_menu2
        opcion = gets.chomp
        case sub_opcion
        when 'a'
          opcion_a
        when 'b'
          opcion_b
        when 'c'
          opcion_c
        when 'd'
          print "Salir al menu principal\n\n"
        else
          print "Error de opcion\n\n"
        end
      end
  when 2
    opcion_2 producto
  when 3
    opcion_3 producto
  when 4
    opcion_4 producto
  when 5
    opcion_5 producto
  when 6
    print "Elegiste salir\n\n"
  else
    print "Error de opcion\n\n"
  end
end
