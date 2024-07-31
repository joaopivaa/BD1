-- EXIBIR O CÓDIGO E NOME DOS PRODUTOS COM A CATEGORIA INICIANDO EM 'SUPER'
SELECT prod.id, prod.name from products prod
    JOIN categories ctgr ON prod.id_categories = ctgr.id
WHERE ctgr.name LIKE 'super%';