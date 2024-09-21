<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadProduto.aspx.cs" Inherits="IrisEComProjeto.CadProduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="cadProduto"> 
        <div class="container mt-4">
            <h2 class="mb-4">Cadastro produto</h2>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="preco">Preço:</label>
                <input type="number" id="preco" name="preco" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="descricao">Descrição:</label>
                <input type="text" id="descricao" name="descricao" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="infoTecnica">Informações Técnicas:</label>
                <input type="text" id="infoTecnica" name="infoTecnica" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="quantidade">Quantidade disponível:</label>
                <input type="text" id="quantidade" name="quantidade" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="imagem">Imagem:</label>
                <input type="text" id="imagem" name="imagem" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="categoriaId">Categoria:</label>
                <input type="number" id="categoriaId" name="categoriaId" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="usuarioId">Usuário:</label>
                <input type="number" id="usuarioId" name="usuarioId" class="form-control"/> 
            </div>
            <button id="btn-salvar" type="submit" class="btn btn-primary btn-block">Salvar</button>
            <button id="btn-voltar" type="button" class="btn btn-primary btn-block">Voltar</button>
        </div>
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $('#cadProduto').on('submit', function (e) {
                e.preventDefault();

                var produto = {
                    nome: $('#nome').val(),
                    preco: parseFloat($('#preco').val()),
                    descricao: $('#descricao').val(),
                    infoTecnica: $('#infoTecnica').val(),
                    quantidade: parseInt($('#quantidade').val()),
                    imagem: $('#imagem').val(),
                    categoriaId: parseInt($('#categoriaId').val()),
                    usuarioId: parseInt($('#usuarioId').val())
                };
                $.ajax({
                    url: 'https://localhost:7178/api/Produto',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(produto),
                    success: function (response) {
                        alert('Produto cadastrado com sucesso!');
                    },
                    error: function (error) {
                        console.error('Erro ao cadastrar o produto:', error);
                    }
                });

            });
            $('#btn-voltar').on('click', function () {
                window.history.back();
            });

        </script>
    </form>
</body>
</html>
