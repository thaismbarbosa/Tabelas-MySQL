import mysql.connector

conexao = mysql.connector.connect(
    host="127.0.0.1", #IP padrao
    port=3306, #porta padrao
    user="root", #admin 
    password="*********", #senha do mysql
    database="ESTOQUE"
    )

# Get a cursor
cursor = conexao.cursor()

# Execute a query
# cursor.execute("CREATE DATABASE ESTOQUE;")
# cursor.execute("""
# CREATE TABLE PRODUTOS(
#                id INT PRIMARY KEY AUTO_INCREMENT,
#                nome VARCHAR(100),
#                descricao VARCHAR(255),
#                quantidade INT,
#                preco DECIMAL(10,02));""")
class Produto:
    def __init__(self, nome_produto, quantidade, preco, id=None):
        self.id = id
        self.nome = nome_produto
        self.quantidade = quantidade
        self.preco = preco
        

    def salvar_produto(self):
        comando = """
            INSERT INTO produtos (nome, quantidade, preco)
            VALUES (%s, %s, %s)
            """
        
        dados = (self.nome, self.quantidade, self.preco)
        cursor.execute(comando, dados)
        conexao.commit()
        self.id = cursor.lastrowid #Retorna o id da ultima linha

        return f'{self.id} - {self.nome} cadastrado com sucesso!'
#os metodos tem que estar dentro da classe!

produto1 = Produto('Luva de Boxe Profissional', 15, 199.90)
print(produto1.salvar_produto())
produto2 = Produto('Kimono Jiu-Jitsu Infantil', 10, 249.50)
print(produto2.salvar_produto())

def listar_produtos():
    #Retornar todos os produtos
    cursor.execute(
    """
        SELECT * FROM produtos
    """
    )

    for produto in cursor.fetchall():
        print('-----------')
        print(f'ID: {produto[0]}')
        print(f'Nome: {produto[1]}')
        print(f'Quantidade: {produto[2]}')
        print(f'Preço: {produto[3]}')

listar_produtos()

cursor.close()
conexao.close()
