-- Tipos variados de consultas:
--      GROUP BY
--      LEFT/RIGHT JOIN
--      MINUS/UNION
--      aninhadas
--      DIVIDE?

-- Listar todos os professores que ensinam todos os instrumentos de uma categoria
-- e têm em média X horas livres por dia
    -- JOIN/"DIVIDE"/GROUP BY/e tudo mais

-- Selecionar, para cada usuário, o seu nome. Para aqueles que são alunos, selecionar
-- o nome (ñ de login) do professor com o maior número de aulas que ensina o tipo de
-- instrumento que o usuário mais alugou
    -- LEFT JOIN++/GROUP BY++

-- Selecionar, para um determinado nome de login (ou para todos, se quiser fazer correlacionado),
-- todos os nomes de login dos locatários que não alugaram nenhum instrumento dos tipos que o usuário
-- alugou. Exemplo: se eu aluguei instrumentos do tipo violão e teclado, selecionar todos os usuários
-- que nunca alugaram nem violão nem teclado.
    -- INTESECT/MINUS/DISTINCT/Aninhada

-- Selecionar todos os usuários que foram a todos os eventos os quais você comprou ingressos
    -- "DIVIDE"/JOIN

-- Dado um organizador que também é aluno, listar todos os professores que já compraram ingressos
-- aos seus eventos e que deram aula ao organizador.
    -- UNIQUE/JOIN

-- Listar todos os eventos em ordem decrescente de lucro por venda de ingressos
    -- ORDER BY/ATRIBUTOS DERIVADOS IMPLÍCITOS (LUCRO)

-- Dado uma classificação de um instrmento, listar o(s) proprietário(s) com maior média de avaliação
-- dessa classificação. (Ex: o proprietário com o maior média de avaliações de instrumentos de cordas)

