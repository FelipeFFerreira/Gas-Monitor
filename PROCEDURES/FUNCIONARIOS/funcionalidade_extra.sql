CREATE PROCEDURE dbo.funcionalidade_extra(
  @nome VARCHAR(50) = NULL
)

AS

IF  @nome IS NULL
BEGIN
  SELECT
    0 success,
    'N�o existe argumento na entrada.' msg
  RETURN 1;
END

SELECT a.nm_acao 
	FROM dbo.TB_Funcionario AS f
	INNER JOIN TB_Funcionalidade_Extra as fe ON fe.id_funcionario = f.id_funcionario
	INNER JOIN TB_Acao as a ON a.id_acao = fe.id_acao
	WHERE f.nm_funcionario = @nome
GO

EXEC dbo.funcionalidade_extra 
@nome = 'Jaime Mathias'
