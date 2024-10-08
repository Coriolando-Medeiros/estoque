def menu
  loop do
    puts "Sistema de Estoque"
    puts "Menu"
    puts "1 - Adicionar"
    puts "2 - Editar"
    puts "3 - Remover"
    puts "4 - Listar"
    puts "5 - Atualizar"
    puts "0 - Sair"
    puts ""
    print "Opção: "
    opcao = gets.chomp
    if opcao == '1'
      adicionar
    elsif opcao == '2'
      editar
    elsif opcao == "3"
      remover
    elsif opcao == '4'
      listar
    elsif opcao == '5'
      atualizar
    elsif opcao == '0'
      return
    else
      puts "Opção inválida, Tente novamente!"
    end
  end
end

def adicionar
  puts "Adicionar Item"
  print "Produto: "
  produto = gets.chomp.capitalize
  print "Preço: "
  preco = gets.chomp.to_f
  print "Quantidade: "
  quantidade = gets.chomp.to_i
  print "Descrição: "
  descricao = gets.chomp.capitalize
  File.open("estoque.txt", "a") do |file|
    file.puts "Produto: #{produto} | Preço: #{preco} | Quantidade: #{quantidade} | Descrição: #{descricao}"
  end
  puts "#{produto} adicionado ao estoque"
end

def editar
  puts "Editar Item"
  if File.exist?("estoque.txt") && !File.zero?("estoque.txt")
    File.open("estoque.txt", "r") do |file|
      file.each_line do |linha|
        puts linha
      end
    end
  end
  puts ""
  puts "Digite o nome do produto que deseja editar"
  produto_editar = gets.chomp.capitalize

  linhas = File.readlines("estoque.txt")
  produto_encontrado = false

  linhas.map! do |linha|
    if linha.include?("Produto: #{produto_editar}")
      puts "Produto encontrado #{linha}"
      puts "Novo nome | pressione ENTER para manter"
      novo_produto = gets.chomp.capitalize
      puts "Novo preço | pressione ENTER para manter"
      novo_preco = gets.chomp
      puts "Nova quantidade | pressione ENTER para manter"
      nova_quantidade = gets.chomp
      puts "Nova descrição | pressione ENTER para manter"
      nova_descricao = gets.chomp

      novo_produto = produto_editar if novo_produto.empty?
      novo_preco = linha.match(/Preço: (\S+)/)[1].to_f if novo_preco.empty?
      nova_quantidade = linha.match(/Quantidade: (\S+)/)[1].to_i if nova_quantidade.empty?
      nova_descricao = linha.match(/Descrição: (\S+)/)[1] if nova_descricao.empty?

      produto_encontrado = true
      "Produto: #{novo_produto} | Preço: #{novo_preco} | Quantidade: #{nova_quantidade} | Descrição: #{nova_descricao}\n"
    else
      linha
    end
  end

  if produto_encontrado
    File.open("estoque.txt", "w") do |file|
      file.puts linhas
    end
    puts "Produto atualizado com sucesso!"
  else
    puts "Produto não encontrado!"
  end
end

def remover
  if File.exist?("estoque.txt") && File.zero?("estoque.txt")
    puts "Estoque vazio!"
    puts "Adicionar Item?"
    puts "1 - Sim | Enter - Não"
    opcao = gets.chomp
    if opcao == '1'
      adicionar
    else
      puts "Saindo..."
      return
    end
  else
    produtos = File.readlines("estoque.txt")

    produtos.each_with_index do |produto, indice|
      puts "Produto: #{indice + 1}: #{produto}"
    end

    puts "Qual produto deseja excluir?"
    puts "Digite o número | Enter para sair"
    escolha = gets.chomp.to_i - 1

    if escolha >= 0 && escolha < produtos.size
      produtos.delete_at(escolha)

      File.open("estoque.txt", "w") do |file|
        file.puts(produtos)
      end

      puts "Produto Excluido!"
    else
      puts "Escolha inválida"
    end
  end
end

def listar
  puts "Listar todo estoque"
  if File.exist?("estoque.txt") && !File.zero?("estoque.txt")
    File.open("estoque.txt", "r") do |file|
      file.each_line do |linha|
        puts linha
      end
    end
  else
    puts "estoque vazio"
    puts "Adicionar novo produto?"
    puts "1 - Sim | Enter - não"
    opcao = gets.chomp
    if opcao == '1'
      adicionar
    else
      puts "Saindo..."
      return
    end
  end
end

def atualizar
  puts "Atualizar estoque | preço e quantidade"
  if File.exist?("estoque.txt") && !File.zero?("estoque.txt")
    File.open("estoque.txt", "r") do |file|
      file.each_line do |linha|
        puts linha
      end
    end

    puts ""
    puts "Digite o nome do produto que deseja atualizar"
    produto_editar = gets.chomp.capitalize

    linhas = File.readlines("estoque.txt")
    produto_encontrado = false

    linhas.map! do |linha|
      if linha.include?("Produto: #{produto_editar} |")
        print "Produto encontrado: #{linha}"
        puts "Novo preço (pressione Enter para manter o valor atual)"
        preco_editar = gets.chomp
        preco_editar = preco_editar.empty? ? linha.match(/Preço: (\S+)/)[1].to_f : preco_editar.to_f

        puts "Nova quantidade (pressione Enter para manter o valor atual)"
        quantidade_editar = gets.chomp
        quantidade_editar = quantidade_editar.empty? ? linha.match(/Quantidade: (\S+)/)[1].to_i : quantidade_editar.to_i

        descricao = linha.match(/Descrição: .+/)[0]

        produto_encontrado = true
        "Produto: #{produto_editar} | Preço: #{preco_editar} | Quantidade: #{quantidade_editar} | #{descricao}\n"
      else
        linha
      end
    end

    if produto_encontrado
      File.open("estoque.txt", "w") do |file|
        file.puts(linhas)
      end
      puts "Produto atualizado com sucesso!"
    else
      puts "Produto não encontrado!"
    end
  else
    puts "Arquivo de estoque não encontrado ou está vazio!"
  end
end



menu