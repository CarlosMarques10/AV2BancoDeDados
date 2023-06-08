--ALUNOS: Carlos artur couto marques / Fabricio maicon felix santos

CREATE TABLE fornecedores(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL
);

CREATE TABLE categorias(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	preco DECIMAL(10,2) NOT NULL,
	id_categoria INTEGER NOT NULL,
	id_fornecedor INTEGER NOT NULL,
	FOREIGN KEY(id_categoria) REFERENCES categorias(id),
	FOREIGN KEY(id_fornecedor) REFERENCES fornecedores(id)
);


CREATE TABLE rastrear_produtos(
	id SERIAL PRIMARY KEY,
	id_produto SERIAL NOT NULL,
	id_fornecedor SERIAL NOT NULL,
	FOREIGN KEY (id_produto) REFERENCES produtos(id),
	FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id)
);

INSERT INTO fornecedores(nome, email) VALUES ('SONY', 'sony@email.com');
INSERT INTO fornecedores(nome, email) VALUES ('MICROSOFT', 'microsoft@email.com');
INSERT INTO fornecedores(nome, email) VALUES ('Apple', 'apple@email.com');

INSERT INTO categorias(nome) VALUES ('Smartphone');
INSERT INTO categorias(nome) VALUES ('Tablet');
INSERT INTO categorias(nome) VALUES ('Notebook');


INSERT INTO produtos(nome,preco,id_categoria,id_fornecedor) VALUES('Iphone 14 PRO MAX',14000.00,1,3);
INSERT INTO produtos(nome,preco,id_categoria,id_fornecedor) VALUES('Iphone XR',3400.15,1,3);
INSERT INTO produtos(nome,preco,id_categoria,id_fornecedor) VALUES('Surface',5000.90,2,2);
INSERT INTO produtos(nome,preco,id_categoria,id_fornecedor) VALUES('Surface GO',3150.50,2,2);
INSERT INTO produtos(nome,preco,id_categoria,id_fornecedor) VALUES('Vaio',8000.00,3,1);
INSERT INTO produtos(nome,preco,id_categoria,id_fornecedor) VALUES('Vaio PRO',9615.00,3,1);

--a)
SELECT produtos.nome, produtos.preco, categorias.nome FROM produtos
JOIN categorias ON categorias.id = produtos.id_categoria WHERE categorias.id = 1

--b)
SELECT * FROM fornecedores;

--c)
SELECT produtos.nome, produtos.preco, fornecedores.nome FROM produtos
JOIN fornecedores ON fornecedores.id = produtos.id_fornecedor WHERE preco > 5000;

--d)
SELECT COUNT(*) as quantidade_tablets FROM produtos WHERE produtos.id_categoria = 2

--e)
SELECT produtos.nome, produtos.preco, fornecedores.nome FROM produtos
JOIN fornecedores ON fornecedores.id = produtos.id_fornecedor WHERE id_fornecedor = 3;

--f)
SELECT produtos.nome, produtos.preco, categorias.nome FROM produtos
JOIN categorias ON categorias.id = produtos.id_categoria ORDER BY produtos.preco DESC

--g)
SELECT AVG(produtos.preco) FROM produtos WHERE id_categoria = 3









