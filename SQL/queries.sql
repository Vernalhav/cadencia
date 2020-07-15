
-- 01) (Luan) Listar todos os professores que ensinam todos os instrumentos de uma categoria
-- e têm em média X horas livres por dia
    -- JOIN/"DIVIDE"/GROUP BY/e tudo mais

-- 02) (Mandela) Selecionar todos os usuários que foram a todos os eventos aos quais você comprou ingressos
    -- "DIVIDE"/JOIN

-- 03) (Giovas) Dado um organizador que também é aluno, listar todos os professores que já compraram ingressos
-- aos seus eventos e que deram aula ao organizador.
    -- UNIQUE/JOIN

-- 04) (Frodo) Listar todos os eventos em ordem decrescente de lucro por venda de ingressos
    -- ORDER BY/ATRIBUTOS DERIVADOS IMPLÍCITOS (LUCRO)

-- 05) (Giovas) Dado uma classificação de um instrmento, listar o(s) proprietário(s) com maior média de avaliação
-- dessa classificação. (Ex: o proprietário com o maior média de avaliações de instrumentos de cordas)

-- 06) (Giovas) Selecionar para cada usuário, nomedelogin, e caso já tenha feito alguma aula mostra a aula feita e ordenar por preço de aula,
-- além de mostrar a forma de pagamento da aula, e caso seja por cartão, mostrar o numero do cartao.

-- 07) (Luan) Selecionar, dado um organizador, a soma de valor em dinheiro de todos os ingressos que ele vendeu, separado pela forma de
-- pagamento e pelo evento. Deve ser mostrado a forma de pagamento e o nome do evento que pertence o valor, ordenado pelo nome do evento
-- e sub ordenado pela forma de pagamento.

-- 08) (Mandela) Listar os alunos que já tiveram aula com um professor com 5 ou mais denuncias
    -- Aninhada não-correlacionada
        
-- 09) (Luan) Listar o CPF, nome de login e avaliação dos usuários que estão envolvidos em um aluguel ativo no momento, isto é, data_emprestimo < data atual < data_devolução.
    -- UNION e MINUS? ( não tenho certeza se é o único jeito de resolver)

-- 10) (Frodo) Buscar os eventos que venderam menos ingressos que a média dos ingressos vendidos dos eventos que ocorreram no mesmo lugar.
    -- Group By, aninhada correlacionada



-- BUFFER

-- Selecionar, para cada usuário, o seu nome. Para aqueles que são alunos, selecionar
-- o nome (ñ de login) do professor com o maior número de aulas que ensina o tipo de
-- instrumento que o usuário mais pegou emprestado
    -- LEFT JOIN++/GROUP BY++

-- Listar os proprietários que tiveram uma avaliação melhor que a média dos proprietários da sua cidade.
    -- pode aumentar a complexidade fazendo com que só considere a avaliação dos últimos 30 dias, assim adicionando uma junção e group by.
    -- Aninhada correlacionada (pode adicionar GROUP BY).

-- Buscar os usuários que já conversaram com o usuário que teve mais denuncias direcionada a ele.
    -- Aninhada não-correlacionada
        -- Pode fazer com que busque qualquer usuário que já esteve envolvido em uma aula ou aluguel com este usuário, assim aumentando a complexidade da consulta.

-- Selecionar, para um determinado nome de login (ou para todos, se quiser fazer correlacionado),
-- todos os nomes de login dos locatários que não alugaram nenhum instrumento dos tipos que o usuário
-- alugou. Exemplo: se eu aluguei instrumentos do tipo violão e teclado, selecionar todos os usuários
-- que nunca alugaram nem violão nem teclado.
    -- INTESECT/MINUS/DISTINCT/Aninhada
