
# Gerenciamento de Vendas

## Descrição
Este projeto implementa um sistema de gerenciamento de vendas em SQL, permitindo o cadastro de produtos e vendas, além de um relatório diário consolidado por meio de uma stored procedure.

## Estrutura do Banco de Dados
O banco de dados `vendas` contém duas tabelas principais:
- **produto**: Armazena informações dos produtos (id, nome, preço).
- **venda**: Registra as vendas realizadas (id, id do produto, quantidade, data da venda).

### Relacionamentos
- A tabela `venda` possui uma chave estrangeira que referencia `produto`, com exclusão em cascata (`ON DELETE CASCADE`).
- A restrição `CHECK` em `venda` garante que a quantidade seja maior que zero.

## Pré-requisitos
- MySQL ou outro SGBD compatível com SQL.
- Permissões para criar e manipular bancos de dados e stored procedures.

## Instalação
1. Execute o script SQL fornecido (`db_vendas.sql`) para criar o banco de dados, tabelas, stored procedure e inserir os dados iniciais.
   ```bash
   mysql -u [usuário] -p < db_vendas.sql
   ```
2. Conecte-se ao banco de dados `vendas`:
   ```sql
   USE vendas;
   ```

## Estrutura do Script
O script contém:
1. **Criação do Banco de Dados**:
   - Cria o banco `vendas` e seleciona-o para uso.
2. **Criação das Tabelas**:
   - Tabelas `produto` e `venda` com seus respectivos atributos e restrições.
3. **Inserção de Dados**:
   - Dados de exemplo para produtos e vendas.
4. **Stored Procedure**:
   - A procedure `RelatorioVendasDiario` gera um relatório consolidado com o nome do produto, quantidade total vendida e a data mais recente da venda.
5. **Chamada da Procedure**:
   - Exemplo de execução da procedure para visualizar o relatório.

## Funcionalidades
- **Gestão de Produtos**: Cadastro de produtos com nome e preço.
- **Gestão de Vendas**: Registro de vendas com quantidade e data, vinculadas a produtos.
- **Relatório Diário**: A stored procedure `RelatorioVendasDiario` consolida as vendas por produto, mostrando quantidade total e data mais recente.

## Consultas Disponíveis
1. **Relatório de Vendas Diário**:
   - Exibe o nome do produto, a soma das quantidades vendidas e a data mais recente de venda, agrupado por produto.
   ```sql
   CALL RelatorioVendasDiario();
   ```

## Exemplo de Uso
Para gerar o relatório de vendas:
```sql
CALL RelatorioVendasDiario();
```

### Saída Esperada
| Nome do Produto   | Quantidade | Data Mais Recente |
|-------------------|------------|-------------------|
| Fone de Ouvido    | 10         | 2025-05-02        |
| Notebook          | 3          | 2025-05-02        |
| Smartphone        | 8          | 2025-05-03        |

## Observações
- Os dados inseridos são exemplos e podem ser modificados conforme necessário.
- A procedure `RelatorioVendasDiario` agrupa vendas por nome do produto e não considera o preço no relatório. Para incluir o valor total, a procedure pode ser ajustada.
- A restrição `CHECK` em `venda` impede quantidades inválidas (zero ou negativas).
