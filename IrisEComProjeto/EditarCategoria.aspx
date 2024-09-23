<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarCategoria.aspx.cs" Inherits="IrisEComProjeto.EditarCategoria" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <title>Editar Categoria</title>
</head>
<body>
    <form id="editCategoria">
        <div class="container mt-4 shadow p-3 mb-5 bg-white rounded">
            <h2 class="mb-4">Editar categoria</h2>
            <div class="form-group">
                <label for="id">Id:</label>
                <input type="number" id="id" name="id" class="form-control" placeholder="Digite o Id da categoria"/>
            </div>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" class="form-control" placeholder="Digite o nome da categoria"/>
            </div>
            <div class="form-group">
                <label for="imagem">Imagem:</label>
                <input type="text" id="imagem" name="imagem" class="form-control" placeholder="Informe a url da imagem"/>
            </div>
            <button id="btn-salvar" type="submit" class="btn btn-dark btn-block">Salvar</button>
            <button id="btn-cancelar" type="button" class="btn btn-dark btn-block">Cancelar</button>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $('#editCategoria').on('submit', function (e) {
                e.preventDefault();
                var categoria = {
                    id: $('#id').val(),
                    nome: $('#nome').val(),
                    imagem: $('#imagem').val()
                };
                $.ajax({
                    url: 'https://localhost:7178/api/Categoria',
                    method: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(categoria),
                    success: function (data) {
                        alert('Categoria editada com sucesso!');
                        window.location.href = 'Default.aspx';
                    },
                    error: function (error) {
                        console.error('Erro ao editar categoria:', error);
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
