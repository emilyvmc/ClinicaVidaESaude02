INSERT INTO paciente(nome, telefone, data_nascimento, email, prontuario)
VALUES
('ciclano','519898102045','10-05-1997','cliclano123@gmail.com','paciente tem dor de cabeça'),
('fulano','519898102046','10-05-1998','fulano123@gmail.com','paciente tem dor na barriga'),
('beltrano','519898102047','10-05-1999','beltrano123@gmail.com','paciente tem dor nas costas');

select * from paciente;

INSERT INTO especialista(nome, crm, especialidade, id_consulta)
VALUES
('marcos','102045','clinico geral',1),
('roberto','102046','cardiologista',2),
('daniel','102047','cirurgiao geral',3);


select * from especialista;

INSERT INTO consulta(data, hora, id_paciente, id_especialista)
VALUES
('20-05-2040','10 horas',1,1),
('20-05-2040','10 horas',2,2),
('20-05-2040','10 horas',3,3);


select * from consulta;

INSERT INTO medicamento(nome, data_validade, quantidade, id_consulta)
VALUES
('paracetamol','10-05-2027',3,16),
('dipirona','10-11-2028',2,17),
('tramadol','05-08-2030',1,18);

select * from medicamento;

INSERT INTO procedimento(nome, id_medicamento, id_especialista, id_consulta)
VALUES 
('curetagem',19,2,21),
('fisioterapia',18,2,22),
('nenhum',17,2,23);

select * from procedimento;

INSERT INTO agenda(id_paciente, id_especialista, id_consulta)
VALUES
(1,2,21),
(1,2,22),
(3,3,23);

select * from agenda;

-- contagem medicamentos --
SELECT COUNT(*) FROM medicamento;
-- Quantidade de consultas por especialista --
SELECT
    e.nome AS especialista,
    e.especialidade,
    COUNT(c.id_consulta) AS total_consultas
FROM especialista e
LEFT JOIN consulta c ON c.id_especialista = e.id_especialista
GROUP BY e.id_especialista, e.nome, e.especialidade
ORDER BY total_consultas DESC;
-- Consultas de um especialista específico --
SELECT
    c.id_consulta,
    c.data,
    c.hora,
    p.nome AS paciente,
    e.nome AS especialista
FROM consulta c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN especialista e ON c.id_especialista = e.id_especialista
WHERE c.id_especialista = 2
ORDER BY c.data DESC;

-- Listar consultas com nome do paciente e do especialista --
SELECT 
    c.id_consulta,
    c.data,
    c.hora,
    p.nome AS paciente,
    e.nome AS especialista,
    e.especialidade
FROM consulta c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN especialista e ON c.id_especialista = e.id_especialista
ORDER BY c.data, c.hora;

UPDATE paciente
SET telefone = '1199555-7788'
WHERE id_paciente = 3;

UPDATE especialista
SET crm = 'SP1234567'
WHERE nome = 'Dr. Marcos Silva';

UPDATE medicamento
SET quantidade = quantidade + 5
WHERE id_medicamento = 10 AND id_consulta = 3;

DELETE FROM procedimento
WHERE id_procedimento = 7;

DELETE FROM medicamento
WHERE id_medicamento = 11;

DELETE FROM agenda
WHERE id_paciente = 4 AND id_consulta = 12;