use ecommerce;
-- inserindo dados no banco de dados

show tables;
desc clients;
insert into clients(Fname, Minit, Lname, CPF, Address) 
					values ('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - SP'),
							 ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - SP'),
							 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - RJ'),
							 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - SP'),
							 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - SP'),
							 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - SP');
                             
desc product;
insert into product(Pname, Classification_kids, Category, Feedback, Size) 
						values ('Fone de ouvido',false,'Eletrônico','4',null),
                              ('Barbie Elsa',true,'Brinquedos','3',null),
                              ('Body Carters',true,'Vestimenta','5',null),
                              ('Microfone Vedo',False,'Eletrônico','4',null),
                              ('Sofá retrátil',False,'Brinquedos','3','3x57x80'),
                              ('Farinha',False,'Alimentos','2',null),
                              ('Fire Stick',False,'Eletrônico','3',null);

desc orders;
insert into orders (idOrderClient, OrderStatus, OrderDescription, ShippingCost)
					values (1, default,'compra via aplicativo',null),
						 (2,default,'compra via aplicativo',50),
						 (3,'Confirmado',null,null),
						 (4,default,'compra via web site',150);

desc productOrder;
select * from orders;
insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) 
					values(22,1,2,null), 
						(23,2,1,null), 
						(25,3,1,null);

desc productStorage;
insert into productStorage (StorageLocation,Quantity) 
							values ('Rio de Janeiro',1000),
									('Rio de Janeiro',500),
									('São Paulo',10),
									('São Paulo',100),
									('São Paulo',10),
									('Brasília',60);

show tables;
insert into storeagelocation (idLproduct, idLstorage, location) 
						values(1,2,'RJ'),
							(2,6,'GO');

insert into supplier (SocialName, CNPJ, contact) 
							values ('Almeida e filhos', 123456789123456,'21985474'),
								('Eletrônicos Silva',854519649143457,'21985484'),
								('Eletrônicos Valma', 934567893934695,'21975474');


insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);
                        

select * from product;
insert into productSeller (idPseller, idPproduct, prodQuantity) values 
						 (1,23,80),
                         (2,24,10);
                         
                         
select * from clients;

-- Contando clientes
select count(*) from clients;

-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname as Client_name, count(*) as Num_Orders
		from clients c 
        inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 

