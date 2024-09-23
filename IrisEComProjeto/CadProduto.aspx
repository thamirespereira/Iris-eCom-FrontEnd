<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadProduto.aspx.cs" Inherits="IrisEComProjeto.CadProduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <title>Cadastro Produto</title>
</head>
<body>
    <form id="cadProduto"> 
        <div class="container mt-4 shadow p-3 mb-5 bg-white rounded">
            <h2 class="mb-4">Cadastro produto</h2>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" class="form-control" placeholder="Digite o nome do produto"/>
            </div>
            <div class="form-group">
                <label for="preco">Preço:</label>
                <input type="number" id="preco" name="preco" class="form-control" placeholder="Digite apenas números"/>
            </div>
            <div class="form-group">
                <label for="descricao">Descrição:</label>
                <textarea type="text" rows="3" id="descricao" name="descricao" class="form-control" placeholder="Digite aqui a descrição do produto..."></textarea>
            </div>
            <div class="form-group">
                <label for="infoTecnica">Informações Técnicas:</label>
                <textarea type="text" rows="5" id="infoTecnica" name="infoTecnica" class="form-control" placeholder="Digite aqui as informações técnicas do produto..."></textarea>
            </div>
            <div class="form-group">
                <label for="quantidade">Quantidade disponível:</label>
                <input type="number" id="quantidade" name="quantidade" class="form-control" placeholder="Digite apenas números"/>
            </div>
            <div class="form-group">
                <label for="imagem">Imagem:</label>
                <input type="text" id="imagem" name="imagem" class="form-control" placeholder="Informe a url da imagem"/>
            </div>
            <div class="form-group">
                <label for="categoriaId">Categoria:</label>
                <input type="number" id="categoriaId" name="categoriaId" class="form-control" placeholder="Digite o Id da categoria do produto"/>
            </div>
            <div class="form-group">
                <label for="usuarioId">Usuário:</label>
                <input type="number" id="usuarioId" name="usuarioId" class="form-control" placeholder="Digite o Id do usuário"/> 
            </div>
            <button id="btn-salvar" type="submit" class="btn btn-dark btn-block">Salvar</button>
            <button id="btn-cancelar" type="button" class="btn btn-dark btn-block">Cancelar</button>
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
                        window.location.href = 'Default.aspx';
                    },
                    error: function (error) {
                        console.error('Erro ao cadastrar o produto:', error);
                    }
                });

            });
            $('#btn-cancelar').on('click', function () {
                window.location.href = 'Default.aspx';
            });

        </script>
    </form>
</body>
</html>
