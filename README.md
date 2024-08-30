# Sistema de Estoque

Este é um sistema simples de gerenciamento de estoque desenvolvido em Ruby. O sistema permite adicionar, editar, remover, listar e atualizar produtos em um arquivo de texto (estoque.txt).
Funcionalidades

   - **Adicionar Produto**: Permite adicionar um novo produto ao estoque, incluindo nome, preço, quantidade e descrição.
   - **Editar Produto**: Permite editar as informações de um produto existente no estoque.
   - **Remover Produto**: Permite remover um produto do estoque.
   - **Listar Produtos**: Exibe a lista de todos os produtos no estoque.
   - **Atualizar Estoque**: Permite atualizar o preço e a quantidade de um produto existente, mantendo a descrição inalterada.

## Como Usar

    Clone ou faça o download deste repositório.
    Execute o script estoque.rb no seu ambiente Ruby:

```
bash
ruby estoque.rb
```

O menu principal será exibido, permitindo que você escolha uma das opções para gerenciar o estoque.
Exemplo de Uso

No menu principal, as opções disponíveis são:

1 - Adicionar
2 - Editar
3 - Remover
4 - Listar
5 - Atualizar
0 - Sair

### Adicionar Produto

Ao selecionar a opção "1 - Adicionar", o sistema solicitará as seguintes informações:

   - Nome do Produto
   - Preço
   - Quantidade
   - Descrição

O produto será adicionado ao arquivo estoque.txt.

### Editar Produto

Ao selecionar a opção "2 - Editar", o sistema exibirá os produtos existentes e permitirá que você escolha qual deseja editar. Você pode alterar o nome, preço, quantidade e descrição do produto.

### Remover Produto

Ao selecionar a opção "3 - Remover", o sistema exibirá a lista de produtos e permitirá que você escolha qual deseja remover.

### Listar Produtos

Ao selecionar a opção "4 - Listar", o sistema exibirá todos os produtos atualmente no estoque.

### Atualizar Estoque

Ao selecionar a opção "5 - Atualizar", o sistema permitirá que você atualize o preço e a quantidade de um produto existente, mantendo a descrição inalterada.

### Arquivo de Estoque

Os produtos são armazenados no arquivo estoque.txt no seguinte formato:

```
bash

Produto: Nome | Preço: X.XX | Quantidade: XX | Descrição: Descrição
```

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e enviar pull requests.

## Licença

Este projeto está licenciado sob a MIT License.
