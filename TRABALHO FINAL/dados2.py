import pandas as pd

# Dados dos usuários
usuarios_data = {
    'id_usuario': [1, 2],
    'nome': ['Daniel', 'Thuany'],
    'tipo_usuario': ['admin', 'user'],
    'email': ['daniel@example.com', 'thuany@example.com']
}

# Dados das categorias
categorias_data = {
    'id_categoria': [1, 2, 3, 4, 5, 6],
    'nome': ['Alimentação', 'Transporte', 'Saúde', 'Educação', 'Lazer', 'Moradia'],
    'icone': ['food', 'transport', 'health', 'education', 'leisure', 'home'],
    'valor_total_categoria': [0, 0, 0, 0, 0, 0],
    'dt_criacao': ['2024-01-01', '2024-02-01', '2024-03-01', '2024-04-01', '2024-05-01', '2024-06-01'],
    'dt_atualizacao': ['2024-06-01', '2024-06-01', '2024-06-01', '2024-06-01', '2024-06-01', '2024-06-01'],
    'id_usuario': [1, 1, 1, 2, 2, 2]
}

# Dados das transações
transacoes_data = {
    'id_transacoes': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
    'nome': ['Compra de supermercado', 'Bilhete de ônibus', 'Consulta médica', 'Mensalidade escolar', 'Cinema', 'Aluguel', 'Compra de supermercado', 'Bilhete de ônibus', 'Consulta médica', 'Mensalidade escolar', 'Cinema', 'Aluguel', 'Compra de supermercado', 'Bilhete de ônibus', 'Consulta médica', 'Mensalidade escolar', 'Cinema', 'Aluguel', 'Compra de supermercado', 'Bilhete de ônibus'],
    'valor_trans': [200.00, 3.50, 150.00, 500.00, 30.00, 800.00, 200.00, 3.50, 150.00, 500.00, 30.00, 800.00, 200.00, 3.50, 150.00, 500.00, 30.00, 800.00, 200.00, 3.50],
    'tipo_operacao': ['despesa', 'receita', 'despesa', 'receita', 'despesa', 'receita', 'despesa', 'receita', 'despesa', 'receita', 'despesa', 'receita', 'despesa', 'receita', 'despesa', 'receita', 'despesa', 'receita', 'despesa', 'receita'],
    'dt_criacao': ['2024-07-01', '2024-01-01', '2024-02-01', '2024-03-01', '2024-04-01', '2024-05-01', '2024-06-01', '2024-07-01', '2024-01-01', '2024-02-01', '2024-03-01', '2024-04-01', '2024-05-01', '2024-06-01', '2024-01-01', '2024-02-01', '2024-03-01', '2024-04-01', '2024-05-01', '2024-06-01'],
    'dt_atualizacao': ['2024-07-01', '2024-01-01', '2024-02-01', '2024-03-01', '2024-04-01', '2024-05-01', '2024-06-01', '2024-07-01', '2024-01-01', '2024-02-01', '2024-03-01', '2024-04-01', '2024-05-01', '2024-06-01', '2024-01-01', '2024-02-01', '2024-03-01', '2024-04-01', '2024-05-01', '2024-06-01'],
    'id_usuario': [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
    'id_categoria': [1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2]
}

# Criar DataFrames
usuarios_df = pd.DataFrame(usuarios_data)
categorias_df = pd.DataFrame(categorias_data)
transacoes_df = pd.DataFrame(transacoes_data)

# Salvar em CSV
usuarios_df.to_csv('/workspaces/BAN/TRABALHO FINAL/dados/usuarios.csv', index=False)
categorias_df.to_csv('/workspaces/BAN/TRABALHO FINAL/dados/categorias.csv', index=False)
transacoes_df.to_csv('/workspaces/BAN/TRABALHO FINAL/dados/transacoes.csv', index=False)
