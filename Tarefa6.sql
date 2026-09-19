SELECT COUNT(*) FROM dados_meteorologicos

SELECT * FROM dados_meteorologicos LIMIT 10 OFFSET 2000;

------------------------------------------------------------------

-- 1. Escreva uma consulta que retorne todas 
--as linhas da tabela onde a uf seja igual 
--a 'SP' e a temperatura_seco_c seja maior do que 30 graus.

SELECT * FROM dados_meteorologicos WHERE UF = 'SP' AND temperatura_seco_c > 30 LIMIT 100
--2. Escreva um comando que mostre a data_br, a hora_utc e a temperatura_max_c, 
--ordenando o resultado da maior temperatura máxima para a menor (ordem decrescente)
SELECT  data_br,hora_utc, temperatura_max_c  FROM dados_meteorologicos where temperatura_max_c is not null 
order by  temperatura_max_c DESC
--3. Escreva um comando SQL que selecione todos os registros da tabela, exibindo apenas as colunas regiao, 
--uf, estacao e data_br, limitando o resultado para as primeiras 100 linhas.

SELECT regiao,uf,estacao,data_br FROM dados_meteorologicos  LIMIT 100

-- 4. Crie uma consulta que conte o número total de registros (linhas) 
--cadastrados na tabela inteira. Use o apelido total_registros para a coluna de resultado.

SELECT COUNT(*) AS "total_registros" FROM dados_meteorologicos

-- 5. Crie uma consulta que conte o número total de registros (linhas) 
--cadastrados na tabela inteira para a estação de Paraty/RJ. 
--Use o apelido total_registros para a coluna de resultado.

SELECT COUNT(*) AS "total_registros" FROM dados_meteorologicos WHERE ESTACAO = 'PARATY'

-- 6. Liste, sem repetições, os nomes das estações do Estado de SP.
SELECT DISTINCT ESTACAO FROM dados_meteorologicos WHERE UF = 'SP' ORDER BY ESTACAO;

-- 7. Escreva um comando SQL que retorne qual foi a maior 
--temperatura máxima (temperatura_max_c) e a 
--menor temperatura mínima (temperatura_min_c) registradas em todo o histórico da tabela.
SELECT  MIN(temperatura_min_c) AS "MINIMO", MAX(temperatura_max_c) AS "MAXIMO" FROM dados_meteorologicos;

-- Fiquei curioso em sabar onde foi que fez tanto frio
SELECT * FROM dados_meteorologicos WHERE temperatura_min_c = (
	SELECT  MIN(temperatura_min_c) AS "MINIMO" FROM dados_meteorologicos
);

-- Fiquei curioso em sabar onde foi que fez tanto calor
SELECT * FROM dados_meteorologicos WHERE temperatura_max_c = (
	SELECT  max(temperatura_max_c) AS "MINIMO" FROM dados_meteorologicos
);

--8. Escreva uma consulta que exiba a média da velocidade do vento (vento_velocidade_ms) 
--e a média da rajada de vento (vento_rajada_ms) para cada regiao.
SELECT uf,avg(vento_velocidade_ms)as vent_veloc_media ,avg(vento_rajada_ms)as vent_raj_media 
FROM dados_meteorologicos 
WHERE vento_velocidade_ms IS NOT NULL and vento_rajada_ms IS NOT NULL
group by uf;

--9. Crie um comando que agrupe os dados por uf e exiba a quantidade total de registros 
--coletados para cada estado.
--Ordene o resultado do estado com mais registros para o com menos registros.
SELECT uf,COUNT(uf) AS total_registros FROM dados_meteorologicos 
group by uf
order by total_registros desc;

--10. Escreva uma consulta para descobrir a temperatura média seca (temperatura_seco_c) por mes.
-- O resultado deve exibir duas colunas: o número do mês e a temperatura média (arredondada ou normal).

SELECT avg(temperatura_seco_c) as media_TempSeco,mes FROM dados_meteorologicos 
group by mes
order by mes;

-- 11. Escreva um comando SQL que calcule o total acumulado de chuva (precipitacao_total_mm) 
--agrupado por data_br, mostrando apenas os dados do estado do 'RJ'.

select data_br, sum(precipitacao_total_mm)
from dados_meteorologicos
where uf = 'RJ' 
and precipitacao_total_mm is not null 
group by data_br
order by data_br;

--12Escreva uma consulta que liste o nome de todas as estações (estacao) e a sua respectiva uf,
--mas exiba apenas aquelas estações que possuem mais de 5.000 registros na tabela.
SELECT estacao, uf, COUNT(*) AS quantidade
FROM dados_meteorologicos
GROUP BY estacao, uf
HAVING COUNT(*) > 5000;

--13 Escreva um comando SQL que agrupe os dados por regiao e uf para calcular
-- a média da umidade mínima (umidade_min_porcento).
-- Filtre o resultado usando HAVING para exibir apenas os grupos onde a média da umidade mínima seja menor do que 70%.
select uf,avg(umidade_min_porcento) as med_umid
from dados_meteorologicos
group by uf
having avg(umidade_min_porcento) < 70
order by med_umid;

--14Crie uma consulta que liste a data_br e a soma total de chuva (precipitacao_total_mm)
-- daquele dia. Exiba apenas os dias em que o total de chuva foi estritamente maior que 100 mm.

select data_br,sum(precipitacao_total_mm) as chuva_dia
from dados_meteorologicos
group by data_br
having sum(precipitacao_total_mm) >100
order by chuva_dia;


-- 15. Escreva uma consulta que retorne a data_br, a hora_utc e a média 
--da radiação global (radiacao_global_kj_m2) por hora para a estação de Piracicaba. 
--     Filtre para que apareçam apenas os horários entre 10h e 16h (hora_utc), 
--agrupando os resultados por data e hora.

select
	data_br
	, hora_utc
	, avg(radiacao_global_kj_m2)
from dados_meteorologicos
where estacao = 'PIRACICABA' AND radiacao_global_kj_m2 IS NOT NULL
GROUP BY data_br, hora_utc
ORDER BY data_br, hora_utc;

