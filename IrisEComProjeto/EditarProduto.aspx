<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarProduto.aspx.cs" Inherits="IrisEComProjeto.EditarProduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <title>Editar Produto</title>
</head>
<body>
    <div class="container m-5">
    <form id="editProduto">
        <div class="container mt-4 col-10 shadow p-3 mb-5 bg-white rounded">

            <div class="form-group">
                <label for="id">Id:</label>
                <input id="id" name="id" type="number" class="form-control" placeholder="Digite o id do produto"/>
            </div>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input id="nome" name="nome" type="text" class="form-control" placeholder="Digite o nome do produto"/>
            </div>

             <div class="form-group">
                 <label for="preco">Preço:</label>
                 <input id="preco" name="preco" type="number" class="form-control" placeholder="Digite apenas números"/>
             </div>

            <div class="form-group">
                <label for="descricao">Descrição:</label>
                <textarea id="descricao" name="descricao" type="text" class="form-control" placeholder="Digite aqui a descrição do produto..."></textarea>
            </div>

            <div class="form-group">
                <label for="infoTecnica">Informações Técnicas:</label>
                <textarea id="infoTecnica" name="infoTecnica" type="text" class="form-control" placeholder="Digite aqui as informações técnicas do produto..."></textarea>
            </div>

            <div>
                <label for="quantidade">Quantidade disponível:</label>
                <input id="quantidade" name="quantidade" type="text" class="form-control" placeholder="Digite apenas números"/>
            </div>
            <div class="form-group">
                <label for="imagem">Imagem:</label>
                <input id="imagem" name="imagem" type="text" class="form-control" placeholder="Informe a url da imagem"/>
            </div>

            <div class="form-group">
                <label for="categoriaId">Categoria:</label>
                <input id="categoriaId" name="categoriaId" type="number" class="form-control" placeholder="Digite o Id da categoria do produto"/>
            </div>

            <div class="form-group">
                <label for="usuarioId">Usuário:</label>
                <input id="usuarioId" name="usuarioId" type="number" class="form-control" placeholder="Digite o Id do usuário"/>
            </div>

            <button id="btn-salvar" type="submit" class="btn btn-dark btn-block">Salvar</button>
            <button id="btn-cancelar" type="button" class=" btn btn-dark btn-block">Voltar</button>

        </div>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $('#editProduto').on('submit', function (e) {
        e.preventDefault();

        var produtoAtualizado = {
            id: $('#id').val(),
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
            url: 'https://localhost:7178/api/Produto' ,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(produtoAtualizado),
            success: function (response) {
                alert('Produto atualizado com sucesso!');
                window.location.href = 'Default.aspx';
            },
            error: function (error) {
                console.error('Erro ao atualizar o produto:', error);
            }
        });
        
    });
    $('#btn-cancelar').on('click', function () {
        window.location.href = 'Default.aspx';
    });

</script>
    </form>
    </div>
</body>
</html>
