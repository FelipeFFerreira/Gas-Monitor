CREATE PROCEDURE dbo.busca_nivel_funcionario(
  @nome VARCHAR(50) = NULL
)

AS

IF @nome IS NULL
BEGIN
  SELECT
    0 success,
    'N�o existe argumento na entrada.' msg
  RETURN 1;
END

SELECT TOP 1 n.nm_nivel
	FROM dbo.TB_Funcionario AS f
	INNER JOIN TB_Nivel as n ON n.id_nivel = f.id_nivel
	WHERE f.nm_funcionario = @nome
GO

EXEC dbo.busca_nivel_funcionario 
@nome = 'Jaime Mathias'