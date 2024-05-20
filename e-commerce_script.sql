-- Criação do BD para o cenário de E-COMMERCE
create database ecommerce;
use ecommerce;
show tables;
desc clients;
-- criando tabela Cliente --
create table clients(
					idClient INT AUTO_INCREMENT,
					Fname VARCHAR(15),
					Minit VARCHAR(3),
					Lname VARCHAR(20),
					CPF CHAR(11) NOT NULL,
					Adress VARCHAR(30),
					CONSTRAINT unique_cpf_client UNIQUE (CPF),
					PRIMARY KEY(idClient)
					);
-- atualizando Atributo 'Adress' corrigindo ortografia e definição
alter table clients change Adress Address VARCHAR(255);
alter table clients auto_increment=1;
desc clients;

-- Criando tabela Produto --
CREATE TABLE product(
					idProduct INT AUTO_INCREMENT,
					Pname VARCHAR(15) NOT NULL,
					Classification_kids BOOL DEFAULT FALSE,
					Category ENUM('Eletronico', 'Vestimenta', 'Brinquedos', 'Esportes', 'Alimentos','Veiculos') NOT NULL,
					Feedback FLOAT DEFAULT 0,
					Size VARCHAR(10),
					PRIMARY KEY(idProduct)
					);

alter table product auto_increment=1;
                    
-- Criando tabela Pedido
CREATE TABLE orders(
					idOrder INT AUTO_INCREMENT,
                    idOrderClient INT,
                    OrderStatus ENUM('Cancelado', 'Confirmado', 'Em Processamento') DEFAULT 'Em Processamento',
                    OrderDescription VARCHAR(255),
                    ShippingCost FLOAT DEFAULT 10,
                    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) references clients(idClient),
                    PRIMARY KEY(idOrder)   
					);
alter table orders auto_increment=1;


-- Criando tabela Estoque
CREATE TABLE productStorage(
					idProdStorage INT AUTO_INCREMENT,
                    StorageLocation VARCHAR(255),
                    Quantity INT DEFAULT 0,
					PRIMARY KEY(idProdStorage)  
					);

alter table productStorage auto_increment=1;
                    
                    
-- Criando tabela Fornecedor
CREATE TABLE supplier(
					idSupplier INT AUTO_INCREMENT,
                    SocialName VARCHAR(255) NOT NULL,
                    CNPJ CHAR(15) NOT NULL,
					Contact CHAR(11) not null,
                    CONSTRAINT unique_supplier UNIQUE (CNPJ),
                    PRIMARY KEY(idSupplier) 
					);

desc supplier;
alter table supplier auto_increment=1;
				
-- Criando tabela Vendedor
CREATE TABLE seller(
					idSeller INT AUTO_INCREMENT,
                    SocialName VARCHAR(255) NOT NULL,
                    AbstName VARCHAR(255),
                    CNPJ CHAR(15),
                    CPF CHAR(9),
                    Location VARCHAR(255),
					Contact CHAR(11) not null,
                    CONSTRAINT unique_CNPJ_seller UNIQUE (CNPJ),
                    CONSTRAINT unique_CPF_seller UNIQUE (CPF),
                    PRIMARY KEY(idSeller) 
					);
                    
alter table seller auto_increment=1;


-- Criando relação M:N - Tabela produto/vendedor
create table productSeller(
							idPseller INT,
                            idPproduct INT,
                            ProdQuantity INT DEFAULT 1,
                            PRIMARY KEY (idPseller, idPproduct),
                            CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
                            CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)
							);
                            
-- M:N Produto/Pedido
create table productOrder(
							idPOproduct INT,
                            idPOorder INT,
                            PoQuantity INT DEFAULT 1,
                            poStatus ENUM('Disponivel',  'Sem Estoque') DEFAULT 'Disponivel',
                            PRIMARY KEY (idPOproduct, idPOorder),
                            CONSTRAINT fk_productOrder_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
                            CONSTRAINT fk_productOrder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
							);


-- M:N Estoque/Produto
create table storeagelocation(
								idLproduct INT,
								idLstorage INT,
								location VARCHAR(255) NOT NULL,
								PRIMARY KEY (idLproduct, idLstorage),
								CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
								CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
								);                    
				
create table ProductSupplier(
							idPsSupplier INT,
							idPsProduct INT,
							Quantity INT NOT NULL,
							PRIMARY KEY (idPsSupplier, idPsProduct),
							CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
							CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
							);     


show tables;

show databases;
use information_schema;
show tables;
desc referential_CONSTRAINTS;
select * from referential_constraints where CONSTRAINT_SCHEMA= 'ecommerce';








                    